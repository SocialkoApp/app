// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

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

String _$AsyncPostHash() => r'be7e2080e19b9f2bb936a4f41b574723a1e16340';

/// See also [AsyncPost].
class AsyncPostProvider
    extends AutoDisposeAsyncNotifierProviderImpl<AsyncPost, PostModel> {
  AsyncPostProvider(
    this.id,
  ) : super(
          () => AsyncPost()..id = id,
          from: asyncPostProvider,
          name: r'asyncPostProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$AsyncPostHash,
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
    covariant _$AsyncPost notifier,
  ) {
    return notifier.build(
      id,
    );
  }
}

typedef AsyncPostRef = AutoDisposeAsyncNotifierProviderRef<PostModel>;

/// See also [AsyncPost].
final asyncPostProvider = AsyncPostFamily();

class AsyncPostFamily extends Family<AsyncValue<PostModel>> {
  AsyncPostFamily();

  AsyncPostProvider call(
    String id,
  ) {
    return AsyncPostProvider(
      id,
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderImpl<AsyncPost, PostModel>
      getProviderOverride(
    covariant AsyncPostProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'asyncPostProvider';
}

abstract class _$AsyncPost
    extends BuildlessAutoDisposeAsyncNotifier<PostModel> {
  late final String id;

  FutureOr<PostModel> build(
    String id,
  );
}
