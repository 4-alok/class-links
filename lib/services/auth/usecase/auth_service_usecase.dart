import '../models/user_type.dart';

abstract class AuthServiceUsecase {
  bool get isAuthenticated;
  Future<UserType> get login;
  Future<void> get logout;
}
