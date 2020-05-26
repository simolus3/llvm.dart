import 'dart:ffi';

import 'package:llvm/bindings.dart';
import 'package:test/test.dart';

void main() {
  Allocator allocator;

  setUp(() => allocator = Allocator());
  tearDown(() => allocator.freeAll());

  test('can read and allocate strings', () {
    final ptr = allocator.allocateUtf8('hello world');

    expect(ptr.readUtf8(), 'hello world');
    expect(ptr.readUtf8(length: 5), 'hello');
  });

  test('can read zero-length string', () {
    final ptr = allocator.allocate<Uint8>()..value = 0;

    expect(ptr.cast<char>().readUtf8(), isEmpty);
  });
}
