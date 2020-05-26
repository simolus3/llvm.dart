import 'dart:ffi';
import 'dart:typed_data';

import 'package:llvm/bindings.dart';
import '../llvm.dart';
import '../disposable.dart';

class MemoryBuffer extends LlvmWrappedObject<LLVMMemoryBuffer>
    implements Disposable {
  MemoryBuffer.raw(Pointer<LLVMMemoryBuffer> handle, [Llvm llvm])
      : super.raw(handle, llvm) {
    this.llvm.trackDisposable(this);
  }

  /// Creates a LLVM memory buffer by copying the Dart [buffer].
  factory MemoryBuffer.copy(ByteBuffer buffer, String name) {
    final length = buffer.lengthInBytes;
    final ptr = llvm.allocator.allocate<Uint8>(count: length);
    ptr.asTypedList(length)..setAll(0, buffer.asUint8List());

    final llvmBuffer = MemoryBuffer.of(ptr, length, name, copy: true);
    llvm.allocator.free(ptr);

    return llvmBuffer;
  }

  /// Creates a LLVM memory buffer from the memory range spanned by [data] and
  /// [length].
  ///
  /// If [copy] is true (defaults to false), the data will be copied before
  /// creating the buffer.
  factory MemoryBuffer.of(Pointer<void> data, int length, String name,
      {bool copy = false}) {
    Pointer<LLVMMemoryBuffer> handle;
    final namePointer = llvm.allocator.allocateUtf8(name);

    if (copy) {
      handle = llvm.bindings.LLVMCreateMemoryBufferWithMemoryRangeCopy(
        data.cast(),
        length,
        namePointer,
      );
    } else {
      handle = llvm.bindings.LLVMCreateMemoryBufferWithMemoryRange(
        data.cast(),
        length,
        namePointer,
        0, // RequiresNullTerminator = false
      );
    }

    return MemoryBuffer.raw(handle);
  }

  /// The length of this buffer, in bytes.
  int get length => bindings.LLVMGetBufferSize(handle);

  /// The content of this buffer as a [Uint8List].
  ///
  /// Changes made to the list will be reflected in the buffer.
  Uint8List get content {
    final start = bindings.LLVMGetBufferStart(handle);
    return start.cast<Uint8>().asTypedList(length);
  }

  @override
  void dispose() {
    bindings.LLVMDisposeMemoryBuffer(handle);
    ownLlvm.untrackDisposable(this);
  }
}
