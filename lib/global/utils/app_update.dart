import 'package:flutter/services.dart';

import 'get_snackbar.dart';
import 'package:in_app_update/in_app_update.dart';

class AndroidAppUpdate {
  Future<void> get update async {
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
