import 'dart:ffi';
import 'dart:typed_data';

import 'package:llvm/llvm.dart';
import 'package:test/test.dart';

void main() {
  tearDown(() => llvm.dispose());

  test('creates memory buffers from ByteBuffer', () {
    final bytes = Uint8List.fromList([1, 2, 3, 4, 5]);
    final buffer = MemoryBuffer.copy(bytes.buffer, 'My buffer');

    expect(buffer.length, equals(5));
    expect(buffer.content, equals(bytes));
  });

  test('creates buffer from memory range', () {
    final pointer = llvm.allocator.allocate<Uint8>(count: 5);
    pointer.asTypedList(5).setAll(0, [1, 2, 3, 4, 5]);

    final buffer = MemoryBuffer.of(pointer, 5, 'My buffer');
    pointer[0] = 10;

    expect(buffer.length, equals(5));
    expect(buffer.content, equals([10, 2, 3, 4, 5]));
  });

  test('copies buffer from memory range', () {
    final pointer = llvm.allocator.allocate<Uint8>(count: 5);
    pointer.asTypedList(5).setAll(0, [1, 2, 3, 4, 5]);

    final buffer = MemoryBuffer.of(pointer, 5, 'My buffer', copy: true);
    pointer[0] = 10;

    expect(buffer.length, equals(5));
    expect(buffer.content, equals([1, 2, 3, 4, 5]));
  });
}
