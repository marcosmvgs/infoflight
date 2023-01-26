import 'package:infoflight/core/models/app_user.dart';
import 'package:infoflight/core/services/auth_mock_service.dart';

abstract class AuthService {
  AppUser? get currentUser;
  Stream<AppUser?> get userChanges;

  Future<void> signup(
    String name,
    String email,
    String password,
  ) async {}

  Future<void> login(
    String email,
    String password,
  ) async {}

  Future<void> logout() async {}

  factory AuthService() {
    return AuthMockService();
  }
}
