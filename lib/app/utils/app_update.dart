import 'package:flutter/services.dart';

import 'get_snackbar.dart';
import 'package:in_app_update/in_app_update.dart';

class AndroidAppUpdate {
  AndroidAppUpdate() {
    InAppUpdate.checkForUpdate().then((value) =>
        value.updateAvailability == UpdateAvailability.updateAvailable
            ? InAppUpdate.performImmediateUpdate().catchError((e) async {
                Message("Error", e.toString());
                await Future.delayed(
                    const Duration(seconds: 2), () => SystemNavigator.pop());
              })
            : null);
  }
}
