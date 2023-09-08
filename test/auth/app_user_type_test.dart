import 'package:class_link/services/auth/models/user_type.dart';
import 'package:flutter_test/flutter_test.dart';

import '../auth/helper/app_user_type_helper.dart';

void main() {
  group('GetAppUserType', () {
    test('should return AppUserType.none for null user', () async { 
      const String? email = null;
      final userType = await email.userType;
      expect(userType, AppUserType.none);
    });

    // -----------------------------------------
    // special case for F7 batch students (2005802 - 2005936) are exceptions

    // outer boundary
    test('should return AppUserType.kiitian for exception email', () async {
      const email = '2005801@kiit.ac.in';
      final userType = await email.userType;
      expect(userType, AppUserType.kiitian);
    });

    // starting boundary
    test('should return AppUserType.appUser for exception email', () async {
      const email = '2005802@kiit.ac.in';
      final userType = await email.userType;
      expect(userType, AppUserType.appUser);
    });

    // inner boundary
    test('should return AppUserType.appUser for exception email', () async {
      const email = '2005847@kiit.ac.in';
      final userType = await email.userType;
      expect(userType, AppUserType.appUser);
    });

    // ending boundary
    test('should return AppUserType.appUser for exception email', () async {
      const email = '2005936@kiit.ac.in';
      final userType = await email.userType;
      expect(userType, AppUserType.appUser);
    });

    // outer boundary
    test('should return AppUserType.kiitian for exception email', () async {
      const email = '2005937@kiit.ac.in';
      final userType = await email.userType;
      expect(userType, AppUserType.kiitian);
    });

    // -----------------------------------------

    test('should return AppUserType.appUser for valid roll number', () async {
      const email = '22051234@kiit.ac.in';
      final userType = await email.userType;
      expect(userType, AppUserType.appUser);
    });

    test('should return AppUserType.none for exception email', () async {
      const email = 'example@gmail.com';
      final userType = await email.userType;
      expect(userType, AppUserType.none);
    });

    test('should return AppUserType.kiitian for invalid roll number', () async {
      const email = '2305@kiit.ac.in';
      final userType = await email.userType;
      expect(userType, AppUserType.kiitian);
    });
  });
}
