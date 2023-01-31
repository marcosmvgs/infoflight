import 'dart:math';
import 'dart:async';
import 'package:infoflight/core/models/app_user.dart';
import 'package:infoflight/core/services/auth_service.dart';

class AuthMockService implements AuthService {
  static final Map<String, AppUser> _users = {};

  @override
  AppUser? get currentUser {
    return _currentUser;
  }
  @override
  Map<String, AppUser> get users {
    return _users;
  }

  static AppUser? _currentUser;
  static MultiStreamController<AppUser?>? _controller;
  static final _userStream = Stream<AppUser?>.multi((controller) {
    _controller = controller;
    _updateUser(null);
  });

  @override
  Future<void> login(
    String email,
    String password,
  ) async {
    _updateUser(_users[email]);
  }

  @override
  Future<void> logout() async {
    _updateUser(null);
  }

  @override
  Future<void> signup(
    String name,
    String email,
    String password,
  ) async {
    final newUser = AppUser(
        id: Random().nextDouble().toString(),
        name: name,
        email: email,
        password: password);

    _users.putIfAbsent(email, () => newUser);
    _updateUser(newUser);
  }

  @override
  Stream<AppUser?> get userChanges {
    return _userStream;
  }

  static void _updateUser(AppUser? user) {
    _currentUser = user;
    _controller?.add(_currentUser);
  }
}
