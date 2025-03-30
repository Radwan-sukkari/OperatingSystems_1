import 'package:injectable/injectable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class UserAuthenticationLocalDataSource {
  Future<String?> userGetRole();
  Future<void> userSaveRole(String role);
}

@LazySingleton(as: UserAuthenticationLocalDataSource)
class AuthImpLocalDataSource implements UserAuthenticationLocalDataSource {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  static const String roleKey = "role";

  static String? userRole;

  @override
  Future<String?> userGetRole() async {
    userRole ??= await storage.read(key: roleKey);
    return userRole;
  }

  @override
  Future<void> userSaveRole(String role) async {
    userRole = role;
    await storage.write(key: roleKey, value: role);
  }
}
