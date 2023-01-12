// import 'package:class_link/services/auth/models/user_type.dart';
// import 'package:class_link/services/auth/repository/auth_service_repo.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'email_exmple.dart';

// void main() {
//   final authService = AuthService();

//   group("Authenticated UserType test", () {
//     test("should return UserType.user if email belongs to CSE", () {
//       for (String email in testValidCSEEmailList) {
//         final res =
//             authService.authDatasources.userType(email) == UserType.user;
//         expect(res, true);
//       }
//     });

//     test(
//         "should return UserType.kiitian if email belongs to KIITIAN and not belongs to KIITIAN CSE",
//         () {
//       for (String email in testInvalidKiitianEmailList) {
//         final type = authService.authDatasources.userType(email);
//         final res = type == UserType.kiitian;
//         expect(res, true);
//       }
//     });

//     test("should return UserType.guest if email doesn't belongs to KIIT", () {
//       final type =
//           authService.authDatasources.userType("kumaralok344@gmail.com");
//       final res = type == UserType.guest;
//       expect(res, true);
//     });
//   });
// }
