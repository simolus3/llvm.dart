import 'package:llvm/llvm.dart';

/// In this example, we'll create a simple llvm function to add two numbers:
///
/// ```dart
/// int sum (int a, int b) {
///   return a + b;
/// }
/// ```
///
/// This example is based on https://www.pauladamsmith.com/blog/2015/01/how-to-get-started-with-llvm-c-api.html
void main() {
  final module = Module('my_module');

  final int64 = IntType(64);
  final functionType = FunctionType(int64, [int64, int64]);

  final function = module.addFunction('sum', functionType);
  final bb = function.appendBasicBlock('entry');

  final builder = InstructionBuilder()..atEndOf(bb);
  final addResult =
      builder.add(function.getParam(0), function.getParam(1), 'tmp');
  builder.returnValue(addResult);

  // Verify the module to ensure everything is working
  print(module);
  module.verify();

  // Finally, run our JIT-compiled method
  llvm.linkInMcJit();
  final engine = ExecutionEngine.forModule(module);
  final result = engine.run(function, [
    GenericValue.ofInt(int64, 3),
    GenericValue.ofInt(int64, 4),
  ]);

  print('Result from JIT function: ${result.toInt}');

  llvm.dispose();
}
