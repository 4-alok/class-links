import 'package:class_link/app/services/auth/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'email_exmple.dart';

void main() {
  final authService = AuthService();

  group("Authenticated UserType test", () {
    test("should return UserType.user if email belongs to CSE", () {
      for (String email in testValidCSEEmailList) {
        final res = authService.userType(email) == UserType.user;
        expect(res, true);
      }
    });

    test(
        "should return UserType.kiitian if email belongs to KIITIAN and not belongs to KIITIAN CSE",
        () {
      for (String email in testInvalidKiitianEmailList) {
        final type = authService.userType(email);
        final res = type == UserType.kiitian;
        expect(res, true);
      }
    });

    test("should return UserType.guest if email doesn't belongs to KIIT", () {
      final type = authService.userType("kumaralok344@gmail.com");
      final res = type == UserType.guest;
      expect(res, true);
    });
  });
}
