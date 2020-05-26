import 'dart:convert';
import 'dart:ffi';

import 'allocator.dart';
import 'llvm.ffi.dart';

class PointerWithLength<T extends NativeType> {
  final Pointer<T> pointer;

  /// The length of this array, in multiples of `sizeof(T)`.
  final int length;

  PointerWithLength(this.pointer, this.length);
}

extension AllocatorUtils on Allocator {
  PointerWithLength<char> allocateUtf8WithLength(String string,
      {bool endWithZero = false}) {
    final encoded = utf8.encode(string);
    int length;
    Pointer<Uint8> ptr;

    if (endWithZero) {
      if (encoded.contains(0)) {
        throw ArgumentError.value(string, 'string', r'May not contain \0');
      }

      length = encoded.length + 1;
      ptr = allocate<Uint8>(count: length);
      ptr.asTypedList(length)
        ..setAll(0, encoded)
        ..[encoded.length] = 0;
    } else {
      length = encoded.length;
      ptr = allocate<Uint8>(count: length);
      ptr.asTypedList(length)..setAll(0, encoded);
    }

    return PointerWithLength(ptr.cast(), length);
  }

  Pointer<char> allocateUtf8(String string) {
    final encoded = utf8.encode(string);

    if (encoded.contains(0)) {
      throw ArgumentError.value(string, 'string', r'May not contain \0');
    }

    final ptr = allocate<Uint8>(count: encoded.length + 1);
    ptr.asTypedList(encoded.length + 1)
      ..setAll(0, encoded)
      ..[encoded.length] = 0;

    return ptr.cast();
  }
}

extension ReadString on Pointer<char> {
  /// When [length] is null or not set, instead reads to the first zero byte.
  String readUtf8({int length}) {
    final asBytes = cast<Uint8>();

    if (length == null) {
      for (length = 0; asBytes[length] != 0; length++) {}
    }

    return utf8.decode(asBytes.asTypedList(length));
  }
}
