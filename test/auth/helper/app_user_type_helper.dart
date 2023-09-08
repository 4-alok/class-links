import 'package:class_link/services/auth/models/user_type.dart';

extension GetAppUserType on String? {
  /// Returns the type of the user as ``[AppUserType]``.
  Future<AppUserType> get userType async {
    final email = this; // Get the email from the user object
    if (email == null) {
      // If the email is null, return AppUserType.none
      return AppUserType.none; // This is a non-KIITian
    } else if (_exceptions(email)) {
      // If the email is an exception, return AppUserType.appUser
      return AppUserType.appUser; // This is a non-KIITian
    } else if (email.endsWith("kiit.ac.in")) {
      // If the email ends with "kiit.ac.in", it is a KIITian
      final rollNo = int.tryParse(email.split("@")[0]) ??
          -1; // Get the roll number from the email
      if (await _isValidRollNo(rollNo)) {
        // If the roll number is valid, return AppUserType.appUser
        return AppUserType.appUser;
      }
      return AppUserType.kiitian; // Otherwise, return AppUserType.kiitian
    } else {
      // Otherwise, return AppUserType.none
      return AppUserType.none;
    }
  }

  /// Checks if the given email is an exception.
  static bool _exceptions(String email) => [
        // special case for F7 batch students (2005802 - 2005936)
        ...List.generate(135, (index) => 2005802 + index).map((e) {
          return '$e@kiit.ac.in';
        }),
      ].contains(email);

  /// Checks if the given roll number is valid.
  Future<bool> _isValidRollNo(int rollNo) async => _startWith(
        rollNo.toString(),
        const [
          '2205', // 2022 CSE and IT
          '2229', // 2022 CSCE
          '2228', // 2022 CSSE
          '2105', // 2021 CSE and IT
          '2106', // 2021 CSE and IT
          '2129', // 2021 CSCE
          '2128', // 2021 CSSE
        ],
      );

  /// Checks if the given string starts with any of the given arguments.
  bool _startWith(String string, List<String> args) {
    for (final arg in args) {
      if (string.startsWith(arg)) return true;
    }
    return false;
  }
}
