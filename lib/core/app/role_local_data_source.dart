import 'package:injectable/injectable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class UserAuthenticationLocalDataSource {
  Future<String?> userGetToken();

  Future<void> userSaveToken(String? token,);
}

@LazySingleton(as: UserAuthenticationLocalDataSource)
class AuthImpLocalDataSource  implements UserAuthenticationLocalDataSource {
  final FlutterSecureStorage storage = FlutterSecureStorage(
  );

  static const String tokenKey = "key";


  @override
  Future<String?> userGetToken() async {
    return await storage.read(key: tokenKey);
  }

  @override
  Future<void> userSaveToken(String? token, ) async {
    if (token == null) {
      throw Exception("Attempting to save a null token");
    }
    await storage.write(key: tokenKey, value: token);
  }}
