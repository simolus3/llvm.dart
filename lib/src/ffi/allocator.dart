import 'dart:ffi';
import 'package:ffi/ffi.dart' as ffi;

abstract class Allocator {
  /// A pointer to store temporary results.
  ///
  /// In Dart we can't do
  /// ```C
  /// size_t len;
  /// char* name = LLVMGetModuleIdentifier(my_module, &len);
  /// ```
  ///
  /// However, allocating a new pointer for each such call is excessive as well.
  /// So, [tmpOut] can be used instead of `&len` when writing Dart bindings.
  Pointer get tmpOut;

  Pointer<T> allocate<T extends NativeType>({int count = 1});
  void free(Pointer ptr);
  void freeAll();

  factory Allocator() = _DefaultAllocator;
}

class _DefaultAllocator implements Allocator {
  final _allocated = <int>{};

  Pointer _tmpOut;
  @override
  Pointer get tmpOut => _tmpOut ??= allocate<Pointer<Void>>();

  @override
  Pointer<T> allocate<T extends NativeType>({int count = 1}) {
    final ptr = ffi.allocate<T>(count: count);
    _allocated.add(ptr.address);
    return ptr;
  }

  @override
  void free(Pointer<NativeType> ptr) {
    assert(_allocated.contains(ptr.address));

    ffi.free(ptr);
    _allocated.remove(ptr.address);
  }

  @override
  void freeAll() {
    _tmpOut = null;
    for (final allocated in _allocated) {
      final ptr = Pointer.fromAddress(allocated);
      ffi.free(ptr);
    }
  }
}
