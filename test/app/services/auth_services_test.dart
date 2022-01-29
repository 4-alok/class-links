import 'package:class_link/app/services/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'email_exmple.dart';

void main() {
  final _authService = AuthService();

  group("Authenticated UserType test", () {
    test("should return UserType.user if email belongs to CSE", () {
      for (String email in testValidCSEEmailList) {
        final res = _authService.userType(email) == UserType.user;
        expect(res, true);
      }
    });

    test(
        "should return UserType.kiitian if email belongs to KIITIAN and not belongs to KIITIAN CSE",
        () {
      for (String email in testInvalidKiitianEmailList) {
        final type = _authService.userType(email);
        final res = type == UserType.kiitian;
        expect(res, true);
      }
    });

    test("should return UserType.guest if email doesn't belongs to KIIT", () {
      final type = _authService.userType("kumaralok344@gmail.com");
      final res = type == UserType.guest;
      expect(res, true);
    });
  });
}
