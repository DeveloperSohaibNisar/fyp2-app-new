import 'package:fyp2_clean_architecture/core/consts.dart';
import 'package:fyp2_clean_architecture/core/providers/shared_preferences_storage_service_provider.dart';
import 'package:fyp2_clean_architecture/core/services/local/storage_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_local_repository.g.dart';

@Riverpod(keepAlive: true)
UserLocalRepository userLocalRepository(UserLocalRepositoryRef ref) {
  final storage = ref.watch(storageServiceProvider);
  return UserLocalRepository(storage);
}

class UserLocalRepository {
  final StorageService storageService;

  UserLocalRepository(this.storageService);

  Future<void> setToken(String token) async {
    await storageService.set(authTokenStorageKey, token);
  }

  Future<String?> getToken() async {
    final token = await storageService.get(authTokenStorageKey);
    return token as String?;
  }

  Future<bool> removeToken() async {
    return await storageService.remove(authTokenStorageKey);
  }
}
