import 'package:hive_flutter/hive_flutter.dart';

class AuthStorage {
  static const String boxName = 'auth';

  static Box get _box => Hive.box(boxName);

  // Save complete login session
  static Future<void> saveLogin({
    required int userId,
    required String token,
  }) async {
    await _box.put('isLoggedIn', true);
    await _box.put('userId', userId);
    await _box.put('token', token);
  }

  // Login status
  static bool get isLoggedIn {
    return _box.get(
      'isLoggedIn',
      defaultValue: false,
    );
  }

  // User ID
  static int? get userId {
    return _box.get('userId');
  }

  // Token
  static String? get token {
    return _box.get('token');
  }

  // Clear login session
  static Future<void> logout() async {
    await _box.clear();
  }
}