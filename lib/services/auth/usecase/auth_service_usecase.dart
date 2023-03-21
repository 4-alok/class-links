import 'package:firebase_auth/firebase_auth.dart';

/// This is an abstract class that defines the methods that must be implemented by any class that wants
/// to be used as an AuthServiceUsecase.
abstract class AuthServiceUsecase {
  bool get isAuthenticated;
  Future<User?> get login;
  Future<void> get logout;
}
