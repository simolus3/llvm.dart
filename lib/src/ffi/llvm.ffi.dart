// auto-generated, DO NOT EDIT
// Instead, run pub run build_runner build

import 'dart:ffi';

class char extends Struct {}

class LLVMValue extends Struct {}

class LLVMType extends Struct {}

class LLVMContext extends Struct {}

class LLVMMemoryBuffer extends Struct {}

class LLVMModule extends Struct {}

class LLVMBasicBlock extends Struct {}

class LLVMBuilder extends Struct {}

class LLVMGenericValue extends Struct {}

class LLVMExecutionEngine extends Struct {}

typedef _LLVMDisposeMessage_native = Void Function(Pointer<char>);
typedef LLVMDisposeMessage_dart = void Function(Pointer<char> Message);
typedef _LLVMContextCreate_native = Pointer<LLVMContext> Function();
typedef LLVMContextCreate_dart = Pointer<LLVMContext> Function();
typedef _LLVMGetGlobalContext_native = Pointer<LLVMContext> Function();
typedef LLVMGetGlobalContext_dart = Pointer<LLVMContext> Function();
typedef _LLVMContextDispose_native = Void Function(Pointer<LLVMContext>);
typedef LLVMContextDispose_dart = void Function(Pointer<LLVMContext> C);
typedef _LLVMCreateMemoryBufferWithMemoryRange_native
    = Pointer<LLVMMemoryBuffer> Function(
        Pointer<char>, IntPtr, Pointer<char>, IntPtr);
typedef LLVMCreateMemoryBufferWithMemoryRange_dart
    = Pointer<LLVMMemoryBuffer> Function(
        Pointer<char> InputData,
        int InputDataLength,
        Pointer<char> BufferName,
        int RequiresNullTerminator);
typedef _LLVMCreateMemoryBufferWithMemoryRangeCopy_native
    = Pointer<LLVMMemoryBuffer> Function(Pointer<char>, IntPtr, Pointer<char>);
typedef LLVMCreateMemoryBufferWithMemoryRangeCopy_dart
    = Pointer<LLVMMemoryBuffer> Function(
        Pointer<char> InputData, int InputDataLength, Pointer<char> BufferName);
typedef _LLVMGetBufferStart_native = Pointer<Void> Function(
    Pointer<LLVMMemoryBuffer>);
typedef LLVMGetBufferStart_dart = Pointer<Void> Function(
    Pointer<LLVMMemoryBuffer> MemBuf);
typedef _LLVMGetBufferSize_native = IntPtr Function(Pointer<LLVMMemoryBuffer>);
typedef LLVMGetBufferSize_dart = int Function(Pointer<LLVMMemoryBuffer> MemBuf);
typedef _LLVMDisposeMemoryBuffer_native = Void Function(
    Pointer<LLVMMemoryBuffer>);
typedef LLVMDisposeMemoryBuffer_dart = void Function(
    Pointer<LLVMMemoryBuffer> MemBuf);
typedef _LLVMModuleCreateWithName_native = Pointer<LLVMModule> Function(
    Pointer<char>);
typedef LLVMModuleCreateWithName_dart = Pointer<LLVMModule> Function(
    Pointer<char> ModuleID);
typedef _LLVMModuleCreateWithNameInContext_native = Pointer<LLVMModule>
    Function(Pointer<char>, Pointer<LLVMContext>);
typedef LLVMModuleCreateWithNameInContext_dart = Pointer<LLVMModule> Function(
    Pointer<char> ModuleID, Pointer<LLVMContext> C);
typedef _LLVMCloneModule_native = Pointer<LLVMModule> Function(
    Pointer<LLVMModule>);
typedef LLVMCloneModule_dart = Pointer<LLVMModule> Function(
    Pointer<LLVMModule> M);
typedef _LLVMDisposeModule_native = Void Function(Pointer<LLVMModule>);
typedef LLVMDisposeModule_dart = void Function(Pointer<LLVMModule> M);
typedef _LLVMGetModuleIdentifier_native = Pointer<char> Function(
    Pointer<LLVMModule>, Pointer<IntPtr>);
typedef LLVMGetModuleIdentifier_dart = Pointer<char> Function(
    Pointer<LLVMModule> M, Pointer<IntPtr> Len);
typedef _LLVMSetModuleIdentifier_native = Void Function(
    Pointer<LLVMModule>, Pointer<char>, IntPtr);
typedef LLVMSetModuleIdentifier_dart = void Function(
    Pointer<LLVMModule> M, Pointer<char> Ident, int Len);
typedef _LLVMPrintModuleToString_native = Pointer<char> Function(
    Pointer<LLVMModule>);
typedef LLVMPrintModuleToString_dart = Pointer<char> Function(
    Pointer<LLVMModule> M);
typedef _LLVMAddFunction_native = Pointer<LLVMValue> Function(
    Pointer<LLVMModule>, Pointer<char>, Pointer<LLVMType>);
typedef LLVMAddFunction_dart = Pointer<LLVMValue> Function(
    Pointer<LLVMModule> M, Pointer<char> Name, Pointer<LLVMType> FunctionTy);
typedef _LLVMVerifyModule_native = IntPtr Function(
    Pointer<LLVMModule>, IntPtr, Pointer<Pointer<char>>);
typedef LLVMVerifyModule_dart = int Function(
    Pointer<LLVMModule> M, int Action, Pointer<Pointer<char>> OutMessage);
typedef _LLVMPrintTypeToString_native = Pointer<char> Function(
    Pointer<LLVMType>);
typedef LLVMPrintTypeToString_dart = Pointer<char> Function(
    Pointer<LLVMType> Val);
typedef _LLVMTypeIsSized_native = IntPtr Function(Pointer<LLVMType>);
typedef LLVMTypeIsSized_dart = int Function(Pointer<LLVMType> Ty);
typedef _LLVMIntTypeInContext_native = Pointer<LLVMType> Function(
    Pointer<LLVMContext>, IntPtr);
typedef LLVMIntTypeInContext_dart = Pointer<LLVMType> Function(
    Pointer<LLVMContext> C, int NumBits);
typedef _LLVMGetIntTypeWidth_native = IntPtr Function(Pointer<LLVMType>);
typedef LLVMGetIntTypeWidth_dart = int Function(Pointer<LLVMType> IntegerTy);
typedef _LLVMFunctionType_native = Pointer<LLVMType> Function(
    Pointer<LLVMType>, Pointer<Pointer<LLVMType>>, IntPtr, IntPtr);
typedef LLVMFunctionType_dart = Pointer<LLVMType> Function(
    Pointer<LLVMType> ReturnType,
    Pointer<Pointer<LLVMType>> ParamTypes,
    int ParamCount,
    int IsVarArg);
typedef _LLVMIsFunctionVarArg_native = IntPtr Function(Pointer<LLVMType>);
typedef LLVMIsFunctionVarArg_dart = int Function(Pointer<LLVMType> FunctionTy);
typedef _LLVMGetReturnType_native = Pointer<LLVMType> Function(
    Pointer<LLVMType>);
typedef LLVMGetReturnType_dart = Pointer<LLVMType> Function(
    Pointer<LLVMType> FunctionTy);
typedef _LLVMCountParamTypes_native = IntPtr Function(Pointer<LLVMType>);
typedef LLVMCountParamTypes_dart = int Function(Pointer<LLVMType> FunctionTy);
typedef _LLVMGetParamTypes_native = Void Function(
    Pointer<LLVMType>, Pointer<Pointer<LLVMType>>);
typedef LLVMGetParamTypes_dart = void Function(
    Pointer<LLVMType> FunctionTy, Pointer<Pointer<LLVMType>> Dest);
typedef _LLVMWriteBitcodeToMemoryBuffer_native = Pointer<LLVMMemoryBuffer>
    Function(Pointer<LLVMModule>);
typedef LLVMWriteBitcodeToMemoryBuffer_dart = Pointer<LLVMMemoryBuffer>
    Function(Pointer<LLVMModule> M);
typedef _LLVMAppendBasicBlockInContext_native = Pointer<LLVMBasicBlock>
    Function(Pointer<LLVMContext>, Pointer<LLVMValue>, Pointer<char>);
typedef LLVMAppendBasicBlockInContext_dart = Pointer<LLVMBasicBlock> Function(
    Pointer<LLVMContext> C, Pointer<LLVMValue> Fn, Pointer<char> Name);
typedef _LLVMDeleteBasicBlock_native = Void Function(Pointer<LLVMBasicBlock>);
typedef LLVMDeleteBasicBlock_dart = void Function(Pointer<LLVMBasicBlock> BB);
typedef _LLVMCreateBuilderInContext_native = Pointer<LLVMBuilder> Function(
    Pointer<LLVMContext>);
typedef LLVMCreateBuilderInContext_dart = Pointer<LLVMBuilder> Function(
    Pointer<LLVMContext> C);
typedef _LLVMPositionBuilder_native = Void Function(
    Pointer<LLVMBuilder>, Pointer<LLVMBasicBlock>, Pointer<LLVMValue>);
typedef LLVMPositionBuilder_dart = void Function(Pointer<LLVMBuilder> Builder,
    Pointer<LLVMBasicBlock> Block, Pointer<LLVMValue> Instr);
typedef _LLVMPositionBuilderBefore_native = Void Function(
    Pointer<LLVMBuilder>, Pointer<LLVMValue>);
typedef LLVMPositionBuilderBefore_dart = void Function(
    Pointer<LLVMBuilder> Builder, Pointer<LLVMValue> instr);
typedef _LLVMPositionBuilderAtEnd_native = Void Function(
    Pointer<LLVMBuilder>, Pointer<LLVMBasicBlock>);
typedef LLVMPositionBuilderAtEnd_dart = void Function(
    Pointer<LLVMBuilder> Builder, Pointer<LLVMBasicBlock> Block);
typedef _LLVMClearInsertionPosition_native = Void Function(
    Pointer<LLVMBuilder>);
typedef LLVMClearInsertionPosition_dart = void Function(
    Pointer<LLVMBuilder> Builder);
typedef _LLVMDisposeBuilder_native = Void Function(Pointer<LLVMBuilder>);
typedef LLVMDisposeBuilder_dart = void Function(Pointer<LLVMBuilder> Builder);
typedef _LLVMBuildRetVoid_native = Pointer<LLVMValue> Function(
    Pointer<LLVMBuilder>);
typedef LLVMBuildRetVoid_dart = Pointer<LLVMValue> Function(
    Pointer<LLVMBuilder> Builder);
typedef _LLVMBuildRet_native = Pointer<LLVMValue> Function(
    Pointer<LLVMBuilder>, Pointer<LLVMValue>);
typedef LLVMBuildRet_dart = Pointer<LLVMValue> Function(
    Pointer<LLVMBuilder> Builder, Pointer<LLVMValue> V);
typedef _LLVMBuildAdd_native = Pointer<LLVMValue> Function(Pointer<LLVMBuilder>,
    Pointer<LLVMValue>, Pointer<LLVMValue>, Pointer<char>);
typedef LLVMBuildAdd_dart = Pointer<LLVMValue> Function(
    Pointer<LLVMBuilder> Builder,
    Pointer<LLVMValue> LHS,
    Pointer<LLVMValue> RHS,
    Pointer<char> Name);
typedef _LLVMBuildSub_native = Pointer<LLVMValue> Function(Pointer<LLVMBuilder>,
    Pointer<LLVMValue>, Pointer<LLVMValue>, Pointer<char>);
typedef LLVMBuildSub_dart = Pointer<LLVMValue> Function(
    Pointer<LLVMBuilder> Builder,
    Pointer<LLVMValue> LHS,
    Pointer<LLVMValue> RHS,
    Pointer<char> Name);
typedef _LLVMGetParam_native = Pointer<LLVMValue> Function(
    Pointer<LLVMValue>, IntPtr);
typedef LLVMGetParam_dart = Pointer<LLVMValue> Function(
    Pointer<LLVMValue> Fn, int index);
typedef _LLVMCreateGenericValueOfInt_native = Pointer<LLVMGenericValue>
    Function(Pointer<LLVMType>, Uint64, IntPtr);
typedef LLVMCreateGenericValueOfInt_dart = Pointer<LLVMGenericValue> Function(
    Pointer<LLVMType> Ty, int N, int IsSigned);
typedef _LLVMGenericValueToInt_native = Uint64 Function(
    Pointer<LLVMGenericValue>, IntPtr);
typedef LLVMGenericValueToInt_dart = int Function(
    Pointer<LLVMGenericValue> GenVal, int IsSigned);
typedef _LLVMLinkInMCJIT_native = Void Function();
typedef LLVMLinkInMCJIT_dart = void Function();
typedef _LLVMCreateExecutionEngineForModule_native = IntPtr Function(
    Pointer<Pointer<LLVMExecutionEngine>>,
    Pointer<LLVMModule>,
    Pointer<Pointer<char>>);
typedef LLVMCreateExecutionEngineForModule_dart = int Function(
    Pointer<Pointer<LLVMExecutionEngine>> OutEE,
    Pointer<LLVMModule> M,
    Pointer<Pointer<char>> OutError);
typedef _LLVMDisposeExecutionEngine_native = Void Function(
    Pointer<LLVMExecutionEngine>);
typedef LLVMDisposeExecutionEngine_dart = void Function(
    Pointer<LLVMExecutionEngine> EE);
typedef _LLVMRunFunction_native = Pointer<LLVMGenericValue> Function(
    Pointer<LLVMExecutionEngine>,
    Pointer<LLVMValue>,
    IntPtr,
    Pointer<Pointer<LLVMGenericValue>>);
typedef LLVMRunFunction_dart = Pointer<LLVMGenericValue> Function(
    Pointer<LLVMExecutionEngine> EE,
    Pointer<LLVMValue> F,
    int NumArgs,
    Pointer<Pointer<LLVMGenericValue>> Args);

class Bindings {
  final LLVMDisposeMessage_dart LLVMDisposeMessage;
  final LLVMContextCreate_dart LLVMContextCreate;
  final LLVMGetGlobalContext_dart LLVMGetGlobalContext;
  final LLVMContextDispose_dart LLVMContextDispose;
  final LLVMCreateMemoryBufferWithMemoryRange_dart
      LLVMCreateMemoryBufferWithMemoryRange;
  final LLVMCreateMemoryBufferWithMemoryRangeCopy_dart
      LLVMCreateMemoryBufferWithMemoryRangeCopy;
  final LLVMGetBufferStart_dart LLVMGetBufferStart;
  final LLVMGetBufferSize_dart LLVMGetBufferSize;
  final LLVMDisposeMemoryBuffer_dart LLVMDisposeMemoryBuffer;
  final LLVMModuleCreateWithName_dart LLVMModuleCreateWithName;
  final LLVMModuleCreateWithNameInContext_dart
      LLVMModuleCreateWithNameInContext;
  final LLVMCloneModule_dart LLVMCloneModule;
  final LLVMDisposeModule_dart LLVMDisposeModule;
  final LLVMGetModuleIdentifier_dart LLVMGetModuleIdentifier;
  final LLVMSetModuleIdentifier_dart LLVMSetModuleIdentifier;
  final LLVMPrintModuleToString_dart LLVMPrintModuleToString;
  final LLVMAddFunction_dart LLVMAddFunction;
  final LLVMVerifyModule_dart LLVMVerifyModule;
  final LLVMPrintTypeToString_dart LLVMPrintTypeToString;
  final LLVMTypeIsSized_dart LLVMTypeIsSized;
  final LLVMIntTypeInContext_dart LLVMIntTypeInContext;
  final LLVMGetIntTypeWidth_dart LLVMGetIntTypeWidth;
  final LLVMFunctionType_dart LLVMFunctionType;
  final LLVMIsFunctionVarArg_dart LLVMIsFunctionVarArg;
  final LLVMGetReturnType_dart LLVMGetReturnType;
  final LLVMCountParamTypes_dart LLVMCountParamTypes;
  final LLVMGetParamTypes_dart LLVMGetParamTypes;
  final LLVMWriteBitcodeToMemoryBuffer_dart LLVMWriteBitcodeToMemoryBuffer;
  final LLVMAppendBasicBlockInContext_dart LLVMAppendBasicBlockInContext;
  final LLVMDeleteBasicBlock_dart LLVMDeleteBasicBlock;
  final LLVMCreateBuilderInContext_dart LLVMCreateBuilderInContext;
  final LLVMPositionBuilder_dart LLVMPositionBuilder;
  final LLVMPositionBuilderBefore_dart LLVMPositionBuilderBefore;
  final LLVMPositionBuilderAtEnd_dart LLVMPositionBuilderAtEnd;
  final LLVMClearInsertionPosition_dart LLVMClearInsertionPosition;
  final LLVMDisposeBuilder_dart LLVMDisposeBuilder;
  final LLVMBuildRetVoid_dart LLVMBuildRetVoid;
  final LLVMBuildRet_dart LLVMBuildRet;
  final LLVMBuildAdd_dart LLVMBuildAdd;
  final LLVMBuildSub_dart LLVMBuildSub;
  final LLVMGetParam_dart LLVMGetParam;
  final LLVMCreateGenericValueOfInt_dart LLVMCreateGenericValueOfInt;
  final LLVMGenericValueToInt_dart LLVMGenericValueToInt;
  final LLVMLinkInMCJIT_dart LLVMLinkInMCJIT;
  final LLVMCreateExecutionEngineForModule_dart
      LLVMCreateExecutionEngineForModule;
  final LLVMDisposeExecutionEngine_dart LLVMDisposeExecutionEngine;
  final LLVMRunFunction_dart LLVMRunFunction;
  Bindings(DynamicLibrary library)
      : LLVMDisposeMessage = library.lookupFunction<_LLVMDisposeMessage_native,
            LLVMDisposeMessage_dart>('LLVMDisposeMessage'),
        LLVMContextCreate = library.lookupFunction<_LLVMContextCreate_native,
            LLVMContextCreate_dart>('LLVMContextCreate'),
        LLVMGetGlobalContext = library.lookupFunction<
            _LLVMGetGlobalContext_native,
            LLVMGetGlobalContext_dart>('LLVMGetGlobalContext'),
        LLVMContextDispose = library.lookupFunction<_LLVMContextDispose_native,
            LLVMContextDispose_dart>('LLVMContextDispose'),
        LLVMCreateMemoryBufferWithMemoryRange = library.lookupFunction<
                _LLVMCreateMemoryBufferWithMemoryRange_native,
                LLVMCreateMemoryBufferWithMemoryRange_dart>(
            'LLVMCreateMemoryBufferWithMemoryRange'),
        LLVMCreateMemoryBufferWithMemoryRangeCopy = library.lookupFunction<
                _LLVMCreateMemoryBufferWithMemoryRangeCopy_native,
                LLVMCreateMemoryBufferWithMemoryRangeCopy_dart>(
            'LLVMCreateMemoryBufferWithMemoryRangeCopy'),
        LLVMGetBufferStart = library.lookupFunction<_LLVMGetBufferStart_native,
            LLVMGetBufferStart_dart>('LLVMGetBufferStart'),
        LLVMGetBufferSize = library.lookupFunction<_LLVMGetBufferSize_native,
            LLVMGetBufferSize_dart>('LLVMGetBufferSize'),
        LLVMDisposeMemoryBuffer = library.lookupFunction<
            _LLVMDisposeMemoryBuffer_native,
            LLVMDisposeMemoryBuffer_dart>('LLVMDisposeMemoryBuffer'),
        LLVMModuleCreateWithName = library.lookupFunction<
            _LLVMModuleCreateWithName_native,
            LLVMModuleCreateWithName_dart>('LLVMModuleCreateWithName'),
        LLVMModuleCreateWithNameInContext = library.lookupFunction<
                _LLVMModuleCreateWithNameInContext_native,
                LLVMModuleCreateWithNameInContext_dart>(
            'LLVMModuleCreateWithNameInContext'),
        LLVMCloneModule = library.lookupFunction<_LLVMCloneModule_native,
            LLVMCloneModule_dart>('LLVMCloneModule'),
        LLVMDisposeModule = library.lookupFunction<_LLVMDisposeModule_native,
            LLVMDisposeModule_dart>('LLVMDisposeModule'),
        LLVMGetModuleIdentifier = library.lookupFunction<
            _LLVMGetModuleIdentifier_native,
            LLVMGetModuleIdentifier_dart>('LLVMGetModuleIdentifier'),
        LLVMSetModuleIdentifier = library.lookupFunction<
            _LLVMSetModuleIdentifier_native,
            LLVMSetModuleIdentifier_dart>('LLVMSetModuleIdentifier'),
        LLVMPrintModuleToString = library.lookupFunction<
            _LLVMPrintModuleToString_native,
            LLVMPrintModuleToString_dart>('LLVMPrintModuleToString'),
        LLVMAddFunction = library.lookupFunction<_LLVMAddFunction_native,
            LLVMAddFunction_dart>('LLVMAddFunction'),
        LLVMVerifyModule = library.lookupFunction<_LLVMVerifyModule_native,
            LLVMVerifyModule_dart>('LLVMVerifyModule'),
        LLVMPrintTypeToString = library.lookupFunction<
            _LLVMPrintTypeToString_native,
            LLVMPrintTypeToString_dart>('LLVMPrintTypeToString'),
        LLVMTypeIsSized = library.lookupFunction<_LLVMTypeIsSized_native,
            LLVMTypeIsSized_dart>('LLVMTypeIsSized'),
        LLVMIntTypeInContext = library.lookupFunction<
            _LLVMIntTypeInContext_native,
            LLVMIntTypeInContext_dart>('LLVMIntTypeInContext'),
        LLVMGetIntTypeWidth = library.lookupFunction<
            _LLVMGetIntTypeWidth_native,
            LLVMGetIntTypeWidth_dart>('LLVMGetIntTypeWidth'),
        LLVMFunctionType = library.lookupFunction<_LLVMFunctionType_native,
            LLVMFunctionType_dart>('LLVMFunctionType'),
        LLVMIsFunctionVarArg = library.lookupFunction<
            _LLVMIsFunctionVarArg_native,
            LLVMIsFunctionVarArg_dart>('LLVMIsFunctionVarArg'),
        LLVMGetReturnType = library.lookupFunction<_LLVMGetReturnType_native,
            LLVMGetReturnType_dart>('LLVMGetReturnType'),
        LLVMCountParamTypes = library.lookupFunction<
            _LLVMCountParamTypes_native,
            LLVMCountParamTypes_dart>('LLVMCountParamTypes'),
        LLVMGetParamTypes = library.lookupFunction<_LLVMGetParamTypes_native,
            LLVMGetParamTypes_dart>('LLVMGetParamTypes'),
        LLVMWriteBitcodeToMemoryBuffer = library.lookupFunction<
                _LLVMWriteBitcodeToMemoryBuffer_native,
                LLVMWriteBitcodeToMemoryBuffer_dart>(
            'LLVMWriteBitcodeToMemoryBuffer'),
        LLVMAppendBasicBlockInContext = library.lookupFunction<
                _LLVMAppendBasicBlockInContext_native,
                LLVMAppendBasicBlockInContext_dart>(
            'LLVMAppendBasicBlockInContext'),
        LLVMDeleteBasicBlock = library.lookupFunction<
            _LLVMDeleteBasicBlock_native,
            LLVMDeleteBasicBlock_dart>('LLVMDeleteBasicBlock'),
        LLVMCreateBuilderInContext = library.lookupFunction<
            _LLVMCreateBuilderInContext_native,
            LLVMCreateBuilderInContext_dart>('LLVMCreateBuilderInContext'),
        LLVMPositionBuilder = library.lookupFunction<
            _LLVMPositionBuilder_native,
            LLVMPositionBuilder_dart>('LLVMPositionBuilder'),
        LLVMPositionBuilderBefore = library.lookupFunction<
            _LLVMPositionBuilderBefore_native,
            LLVMPositionBuilderBefore_dart>('LLVMPositionBuilderBefore'),
        LLVMPositionBuilderAtEnd = library.lookupFunction<
            _LLVMPositionBuilderAtEnd_native,
            LLVMPositionBuilderAtEnd_dart>('LLVMPositionBuilderAtEnd'),
        LLVMClearInsertionPosition = library.lookupFunction<
            _LLVMClearInsertionPosition_native,
            LLVMClearInsertionPosition_dart>('LLVMClearInsertionPosition'),
        LLVMDisposeBuilder = library.lookupFunction<_LLVMDisposeBuilder_native,
            LLVMDisposeBuilder_dart>('LLVMDisposeBuilder'),
        LLVMBuildRetVoid = library.lookupFunction<_LLVMBuildRetVoid_native,
            LLVMBuildRetVoid_dart>('LLVMBuildRetVoid'),
        LLVMBuildRet =
            library.lookupFunction<_LLVMBuildRet_native, LLVMBuildRet_dart>(
                'LLVMBuildRet'),
        LLVMBuildAdd =
            library.lookupFunction<_LLVMBuildAdd_native, LLVMBuildAdd_dart>(
                'LLVMBuildAdd'),
        LLVMBuildSub =
            library.lookupFunction<_LLVMBuildSub_native, LLVMBuildSub_dart>(
                'LLVMBuildSub'),
        LLVMGetParam =
            library.lookupFunction<_LLVMGetParam_native, LLVMGetParam_dart>(
                'LLVMGetParam'),
        LLVMCreateGenericValueOfInt = library.lookupFunction<
            _LLVMCreateGenericValueOfInt_native,
            LLVMCreateGenericValueOfInt_dart>('LLVMCreateGenericValueOfInt'),
        LLVMGenericValueToInt = library.lookupFunction<
            _LLVMGenericValueToInt_native,
            LLVMGenericValueToInt_dart>('LLVMGenericValueToInt'),
        LLVMLinkInMCJIT = library.lookupFunction<_LLVMLinkInMCJIT_native,
            LLVMLinkInMCJIT_dart>('LLVMLinkInMCJIT'),
        LLVMCreateExecutionEngineForModule = library.lookupFunction<
                _LLVMCreateExecutionEngineForModule_native,
                LLVMCreateExecutionEngineForModule_dart>(
            'LLVMCreateExecutionEngineForModule'),
        LLVMDisposeExecutionEngine = library.lookupFunction<
            _LLVMDisposeExecutionEngine_native,
            LLVMDisposeExecutionEngine_dart>('LLVMDisposeExecutionEngine'),
        LLVMRunFunction = library.lookupFunction<_LLVMRunFunction_native,
            LLVMRunFunction_dart>('LLVMRunFunction');
}
