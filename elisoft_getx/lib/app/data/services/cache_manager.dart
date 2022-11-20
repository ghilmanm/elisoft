import 'package:get_storage/get_storage.dart';

import '../models/user.dart';

mixin CacheManager {
  Future<bool> saveUser(User user) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.user.toString(), user.toJson());
    return true;
  }

  Future<User> getUser() async {
    final box = GetStorage();
    return User.fromJson(await box.read(CacheManagerKey.user.toString()));
  }

  Future<void> removeUser() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.user.toString());
  }
}

enum CacheManagerKey { user }
