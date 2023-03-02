// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cult.provider.dart';

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

String _$AsyncCultHash() => r'5178a01487e7a8043ac9e460f4ef1ac402da0a5d';

/// See also [AsyncCult].
final asyncCultProvider =
    AutoDisposeAsyncNotifierProvider<AsyncCult, CultModel>(
  AsyncCult.new,
  name: r'asyncCultProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$AsyncCultHash,
);
typedef AsyncCultRef = AutoDisposeAsyncNotifierProviderRef<CultModel>;

abstract class _$AsyncCult extends AutoDisposeAsyncNotifier<CultModel> {
  @override
  FutureOr<CultModel> build();
}
