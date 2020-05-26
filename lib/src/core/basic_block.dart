import 'dart:ffi';

import 'package:llvm/bindings.dart';
import 'package:llvm/llvm.dart';

class BasicBlock extends LlvmWrappedObject<LLVMBasicBlock> {
  BasicBlock.raw(Pointer<LLVMBasicBlock> handle, [Llvm llvm])
      : super.raw(handle, llvm);

  void delete() {
    bindings.LLVMDeleteBasicBlock(handle);
  }
}
