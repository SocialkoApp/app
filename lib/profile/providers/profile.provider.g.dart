// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.provider.dart';

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

String _$profileHash() => r'7355ffdbcdc77c20fd220be82b26fa897831b729';

/// See also [profile].
class ProfileProvider extends AutoDisposeFutureProvider<ProfileResponse> {
  ProfileProvider(
    this.username,
  ) : super(
          (ref) => profile(
            ref,
            username,
          ),
          from: profileProvider,
          name: r'profileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$profileHash,
        );

  final String username;

  @override
  bool operator ==(Object other) {
    return other is ProfileProvider && other.username == username;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, username.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef ProfileRef = AutoDisposeFutureProviderRef<ProfileResponse>;

/// See also [profile].
final profileProvider = ProfileFamily();

class ProfileFamily extends Family<AsyncValue<ProfileResponse>> {
  ProfileFamily();

  ProfileProvider call(
    String username,
  ) {
    return ProfileProvider(
      username,
    );
  }

  @override
  AutoDisposeFutureProvider<ProfileResponse> getProviderOverride(
    covariant ProfileProvider provider,
  ) {
    return call(
      provider.username,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'profileProvider';
}
