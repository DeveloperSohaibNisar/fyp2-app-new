// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_user.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getUserHash() => r'5124729f086fdcae463b74b3cda78d9868eac7a4';

/// See also [getUser].
@ProviderFor(getUser)
final getUserProvider = FutureProvider<UserModel?>.internal(
  getUser,
  name: r'getUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetUserRef = FutureProviderRef<UserModel?>;
String _$currentUserHash() => r'1f397475edb1e4049e21e5fac795b819676581fa';

/// See also [CurrentUser].
@ProviderFor(CurrentUser)
final currentUserProvider =
    NotifierProvider<CurrentUser, AsyncValue<UserModel>>.internal(
  CurrentUser.new,
  name: r'currentUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentUser = Notifier<AsyncValue<UserModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
