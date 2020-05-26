import 'dart:async';
import 'dart:ffi';

import 'package:llvm/bindings.dart';
import 'package:llvm/llvm.dart';
import 'package:meta/meta.dart';

import 'disposable.dart';
import '' as lib;

class Llvm implements Disposable {
  final Allocator allocator;
  final Bindings bindings;

  final Set<Disposable> _childDisposables = {};
  bool _isDisposing = false;

  Llvm._(this.allocator, this.bindings);

  factory Llvm(DynamicLibrary library, {Allocator allocator}) {
    allocator ??= Allocator();

    return Llvm._(allocator, Bindings(library));
  }

  factory Llvm.open({Allocator allocator}) {
    final library = DynamicLibrary.open('libLLVM.so');
    return Llvm(library, allocator: allocator);
  }

  Context get globalContext => Context.raw(bindings.LLVMGetGlobalContext());

  void linkInMcJit() {
    bindings.LLVMLinkInMCJIT();
  }

  void trackDisposable(Disposable disposable) {
    _childDisposables.add(disposable);
  }

  void untrackDisposable(Disposable disposable) {
    if (!_isDisposing) {
      _childDisposables.remove(disposable);
    }
  }

  @override
  void dispose() {
    _isDisposing = true;
    for (final disposable in _childDisposables) {
      disposable.dispose();
    }
    _childDisposables.clear();

    allocator.freeAll();
    _isDisposing = false;
  }
}

class _LlvmBox {
  Llvm result;

  Llvm getOrCreate() {
    return result ??= Llvm.open();
  }
}

final _defaultBox = _LlvmBox();

Llvm get llvm {
  final box = (Zone.current[#_LlvmBox] as _LlvmBox) ?? _defaultBox;
  return box.getOrCreate();
}

@immutable
abstract class LlvmWrappedObject<T extends NativeType> {
  /// The pointer towards the underlying LLVM reference.
  final Pointer<T> handle;

  /// The [Llvm] instance managing this object.
  final Llvm llvm;

  @protected
  // ignore: unnecessary_this
  Llvm get ownLlvm => this.llvm; // easy to confuse with top-level getter

  @protected
  Bindings get bindings => ownLlvm.bindings;

  @protected
  Allocator get allocator => ownLlvm.allocator;

  LlvmWrappedObject.raw(this.handle, [Llvm llvm]) : llvm = llvm ?? lib.llvm;

  @override
  int get hashCode => handle.hashCode;

  @override
  bool operator ==(other) {
    return identical(this, other) ||
        other.runtimeType == runtimeType &&
            (other as LlvmWrappedObject).handle == handle;
  }
}

class LlvmException implements Exception {}

class LlvmBasicException implements LlvmException {
  final String msg;
  final String llvmMsg;

  LlvmBasicException(this.msg, this.llvmMsg);

  @override
  String toString() {
    return '$msg: $llvmMsg';
  }
}
