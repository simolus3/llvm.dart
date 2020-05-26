import 'dart:ffi';

import 'package:llvm/bindings.dart';
import 'package:llvm/llvm.dart';

class Context extends LlvmWrappedObject<LLVMContext> implements Disposable {
  Context.raw(Pointer<LLVMContext> handle, [Llvm llvm])
      : super.raw(handle, llvm);

  factory Context() {
    final ctx = Context.raw(llvm.bindings.LLVMContextCreate());

    // Add disposable here instead of in .raw() as that might be used to global
    // contexts that we don't need to dispose
    llvm.trackDisposable(ctx);

    return ctx;
  }

  @override
  void dispose() {
    bindings.LLVMContextDispose(handle);
    ownLlvm.untrackDisposable(this);
  }
}
