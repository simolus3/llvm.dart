import 'dart:ffi';

import 'package:llvm/bindings.dart';
import 'package:llvm/llvm.dart';

class ExecutionEngine extends LlvmWrappedObject<LLVMExecutionEngine>
    implements Disposable {
  ExecutionEngine.raw(Pointer<LLVMExecutionEngine> handle, [Llvm llvm])
      : super.raw(handle, llvm);

  factory ExecutionEngine.forModule(Module module) {
    final outEE = llvm.allocator.allocate<Pointer<LLVMExecutionEngine>>();
    final outError = llvm.allocator.tmpOut.cast<Pointer<char>>();

    final result = llvm.bindings
        .LLVMCreateExecutionEngineForModule(outEE, module.handle, outError);

    if (result != 0) {
      final msg = outError.value.readUtf8();
      llvm.bindings.LLVMDisposeMessage(outError.value);
      llvm.allocator.free(outEE);
      throw LlvmBasicException('Could not create execution engine', msg);
    }

    final engine = ExecutionEngine.raw(outEE.value);
    llvm.allocator.free(outEE);

    return engine;
  }

  GenericValue run(Value function, List<GenericValue> args) {
    final argPtr =
        allocator.allocate<Pointer<LLVMGenericValue>>(count: args.length);
    for (var i = 0; i < args.length; i++) {
      argPtr[i] = args[i].handle;
    }

    final result = bindings.LLVMRunFunction(
      handle,
      function.handle,
      args.length,
      argPtr,
    );
    allocator.free(argPtr);

    return GenericValue.raw(result, ownLlvm);
  }

  @override
  void dispose() {
    bindings.LLVMDisposeExecutionEngine(handle);
    ownLlvm.untrackDisposable(this);
  }
}

class GenericValue extends LlvmWrappedObject<LLVMGenericValue> {
  GenericValue.raw(Pointer<LLVMGenericValue> handle, [Llvm llvm])
      : super.raw(handle, llvm);

  factory GenericValue.ofInt(IntType type, int int, {bool isSigned = false}) {
    final ptr = llvm.bindings
        .LLVMCreateGenericValueOfInt(type.handle, int, isSigned ? 0 : 1);
    return GenericValue.raw(ptr);
  }

  int get toInt {
    return bindings.LLVMGenericValueToInt(handle, 0);
  }
}
