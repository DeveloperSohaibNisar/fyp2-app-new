import 'dart:async';

import 'package:fyp2_clean_architecture/core/services/local/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService implements StorageService {
  SharedPreferences? _sharedPreferences;
  SharedPrefsService() {
    // ignore: invalid_use_of_visible_for_testing_member
    // SharedPreferences.setMockInitialValues({});
  }
  final Completer<SharedPreferences> _initCompleter =
      Completer<SharedPreferences>();

  @override
  void init() {
    _initCompleter.complete(SharedPreferences.getInstance());
  }

  @override
  bool get hasInitialized => _sharedPreferences != null;

  @override
  Future<Object?> get(String key) async {
    _sharedPreferences = await _initCompleter.future;
    return _sharedPreferences!.get(key);
  }

  @override
  Future<void> clear() async {
    _sharedPreferences = await _initCompleter.future;
    await _sharedPreferences!.clear();
  }

  @override
  Future<bool> has(String key) async {
    _sharedPreferences = await _initCompleter.future;
    return _sharedPreferences?.containsKey(key) ?? false;
  }

  @override
  Future<bool> remove(String key) async {
    _sharedPreferences = await _initCompleter.future;
    return await _sharedPreferences!.remove(key);
  }

  @override
  Future<bool> set(String key, data) async {
    _sharedPreferences = await _initCompleter.future;
    return await _sharedPreferences!.setString(key, data.toString());
  }
}
