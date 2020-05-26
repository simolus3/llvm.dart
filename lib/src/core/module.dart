import 'dart:ffi';

import 'package:llvm/llvm.dart';
import 'package:llvm/bindings.dart';
import 'package:llvm/src/core/memory_buffers.dart';

class Module extends LlvmWrappedObject<LLVMModule> implements Disposable {
  Module.raw(Pointer<LLVMModule> handle, [Llvm parent])
      : super.raw(handle, parent) {
    ownLlvm.trackDisposable(this);
  }

  /// Creates a new, empty module in the global context.
  factory Module(String name) {
    final namePtr = llvm.allocator.allocateUtf8(name);
    final module = Module.raw(llvm.bindings.LLVMModuleCreateWithName(namePtr));
    llvm.allocator.free(namePtr);

    return module;
  }

  String get identifier {
    final lengthOut = allocator.tmpOut.cast<IntPtr>();
    final ptr = bindings.LLVMGetModuleIdentifier(handle, lengthOut);

    final string = ptr.readUtf8(length: lengthOut.value);
    return string;
  }

  set identifier(String value) {
    final name = allocator.allocateUtf8WithLength(value);
    bindings.LLVMSetModuleIdentifier(handle, name.pointer, name.length);
    allocator.free(name.pointer);
  }

  /// Writes this modules to a new memory buffer and returns it.
  MemoryBuffer writeToBuffer() {
    return MemoryBuffer.raw(
        bindings.LLVMWriteBitcodeToMemoryBuffer(handle), ownLlvm);
  }

  /// Creates an exact copy of this module.
  Module clone() {
    return Module.raw(bindings.LLVMCloneModule(handle), ownLlvm);
  }

  Value addFunction(String name, FunctionType type) {
    final namePtr = allocator.allocateUtf8(name);
    final value =
        Value.raw(bindings.LLVMAddFunction(handle, namePtr, type.handle));
    allocator.free(namePtr);
    return value;
  }

  /// Verifies this module, or throws an [InvalidModuleException].
  void verify() {
    final errorOut = allocator.tmpOut.cast<Pointer<char>>();
    final result = bindings.LLVMVerifyModule(
      handle,
      2, // LLVMReturnStatusAction: https://llvm.org/doxygen/group__LLVMCAnalysis.html#gab29480cbd10b9b49e7a95870369497ee
      errorOut,
    );

    if (result != 0) {
      final result = errorOut.value.readUtf8();
      bindings.LLVMDisposeMessage(errorOut.value);
      throw InvalidModuleException(result);
    }
  }

  @override
  String toString() {
    return bindings.LLVMPrintModuleToString(handle).readUtf8();
  }

  @override
  void dispose() {
    bindings.LLVMDisposeModule(handle);
    ownLlvm.untrackDisposable(this);
  }
}

class InvalidModuleException implements LlvmException {
  final String message;

  InvalidModuleException(this.message);

  @override
  String toString() {
    return 'Invalid module: $message';
  }
}
