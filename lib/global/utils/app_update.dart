import 'package:flutter/services.dart';
import 'package:in_app_update/in_app_update.dart';

import 'get_snackbar.dart';

class AndroidAppUpdate {
  const AndroidAppUpdate._();

  static Future<void> get update async {
    final res = await InAppUpdate.checkForUpdate();
    res.updateAvailability == UpdateAvailability.updateAvailable
        ? InAppUpdate.performImmediateUpdate().then((value) {
            value == AppUpdateResult.userDeniedUpdate
                ? SystemNavigator.pop()
                : null;
          }).catchError((e) async {
            Message("Error", e.toString());
            await Future.delayed(
                const Duration(seconds: 2), () => SystemNavigator.pop());
          })
        : null;
  }
}
