import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_type.dart';

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

  Future<bool> _isValidRollNo(int rollNo) async => _startWith(
        rollNo.toString(),
        [
          '2205', // 2022 CSE and IT
          '2229', // 2022 CSCE
          '2228', // 2022 CSSE
          '2105', // 2021 CSE and IT
          '2106', // 2021 CSE and IT
          '2129', // 2021 CSCE
          '2128', // 2021 CSSE
        ],
      );

  bool _startWith(String string, List<String> args) {
    if (string.startsWith('2005847')) return true; // ;)
    for (final arg in args) {
      if (string.startsWith(arg)) return true;
    }
    return false;
  }
}
