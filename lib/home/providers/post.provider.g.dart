// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$asyncPostHash() => r'c38d90fd505e7f7833165adedb93b63a672090c7';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$AsyncPost
    extends BuildlessAutoDisposeAsyncNotifier<PostModel> {
  late final String id;

  FutureOr<PostModel> build(
    String id,
  );
}

/// See also [AsyncPost].
@ProviderFor(AsyncPost)
const asyncPostProvider = AsyncPostFamily();

/// See also [AsyncPost].
class AsyncPostFamily extends Family<AsyncValue<PostModel>> {
  /// See also [AsyncPost].
  const AsyncPostFamily();

  /// See also [AsyncPost].
  AsyncPostProvider call(
    String id,
  ) {
    return AsyncPostProvider(
      id,
    );
  }

  @override
  AsyncPostProvider getProviderOverride(
    covariant AsyncPostProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'asyncPostProvider';
}

/// See also [AsyncPost].
class AsyncPostProvider
    extends AutoDisposeAsyncNotifierProviderImpl<AsyncPost, PostModel> {
  /// See also [AsyncPost].
  AsyncPostProvider(
    this.id,
  ) : super.internal(
          () => AsyncPost()..id = id,
          from: asyncPostProvider,
          name: r'asyncPostProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$asyncPostHash,
          dependencies: AsyncPostFamily._dependencies,
          allTransitiveDependencies: AsyncPostFamily._allTransitiveDependencies,
        );

  final String id;

  @override
  bool operator ==(Object other) {
    return other is AsyncPostProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<PostModel> runNotifierBuild(
    covariant AsyncPost notifier,
  ) {
    return notifier.build(
      id,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
