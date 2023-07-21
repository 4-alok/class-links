import 'package:firebase_auth/firebase_auth.dart';

// import '../../../global/utils/patch.dart';
import '../models/user_type.dart';

/// An extension method on the `num` class. It is used to check if a number is between two numbers.
extension Range on num {
  bool isBetween(num from, num to) => from <= this && this <= to;
}

/// An extension method on the `User` class. It is used to get the user type of the user.
extension GetAppUserType on User? {
  /// An extension method on the `User` class. It is used to get the user type of the user.
  Future<AppUserType> get userType async {
    final email = this?.email;
    if (email == null) {
      return AppUserType.none;
    } else if (email.endsWith("kiit.ac.in")) {
      final rollNo = int.tryParse(email.split("@")[0]) ?? -1;
      if (await _isValidRollNo(rollNo)) return AppUserType.appUser;
      return AppUserType.kiitian;
    } else if (_exceptions(email)) {
      return AppUserType.appUser;
    } else {
      return AppUserType.none;
    }
  }

  /// If the email is in the list of exceptions, return true
  ///
  /// Args:
  ///   email (String): The email address to validate.
  static bool _exceptions(String email) => [].contains(email);

  /// It checks if the roll number is between the range of roll numbers of the current batch or if it is
  /// in the list of roll numbers of the users who have registered
  ///
  /// Args:
  ///   rollNo (int): The roll number of the student.
  ///
  /// Returns:
  ///   A Future<bool> object.
  Future<bool> _isValidRollNo(int rollNo) async {
    // // 2022 CSE and IT
    // if (rollNo.isBetween(2205000, 2205999) ||
    //     rollNo.isBetween(22051000, 22054400)) {
    //   return true;
    // }

    // 2021 CSE and IT
    if (rollNo.isBetween(2105000, 2106322) ||
        rollNo.isBetween(21051000, 21054000)) {
      return true;
    }

    // 2021 CSCE and CSSE
    else if (rollNo.isBetween(2129001, 2129160) ||
        rollNo.isBetween(2128001, 2128141)) {
      return true;
    }

    // // 2020 CSE and IT
    // else if (await Patch.isRollNoInUserList(rollNo)) {
    //   return true;
    // }
    return false;
  }
}
