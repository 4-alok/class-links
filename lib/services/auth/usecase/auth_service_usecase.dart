import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthServiceUsecase {
  bool get isAuthenticated;
  Future<User?> get login;
  Future<void> get logout;
}
