import 'package:class_link/global/utils/csv_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_type.dart';

extension Range on num {
  bool isBetween(num from, num to) => from <= this && this <= to;
}

extension GetAppUserType on User? {
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

  static bool _exceptions(String email) => [].contains(email);

  Future<bool> _isValidRollNo(int rollNo) async {
    // 2022 CSE and IT
    if (rollNo.isBetween(2205000, 2205999) ||
        rollNo.isBetween(22051000, 22054400)) {
      return true;
    }

    // 2021 CSE and IT
    else if (rollNo.isBetween(2105000, 2106322) ||
        rollNo.isBetween(21051000, 21054000)) {
      return true;
    }

    // 2021 CSCE and CSSE
    else if (rollNo.isBetween(2129001, 2129160) ||
        rollNo.isBetween(2128001, 2128141)) {
      return true;
    } else if (await _isRollNoInUserList(rollNo)) {
      return true;
    }
    return false;
  }

  Future<bool> _isRollNoInUserList(int rollNo) async =>
      (await CsvUtils.readCSVFile('assets/database/3rd_year/6_sem_user.csv'))
          .map((e) => e.first)
          .contains(rollNo);
}
