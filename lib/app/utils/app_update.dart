import 'get_snackbar.dart';
import 'package:in_app_update/in_app_update.dart';

class AndroidAppUpdate {
  AndroidAppUpdate() {
    InAppUpdate.checkForUpdate().then((value) =>
        value.updateAvailability == UpdateAvailability.updateAvailable
            ? InAppUpdate.performImmediateUpdate()
                .catchError((e) => Message("Error", e.toString()))
            : null);
  }
}
