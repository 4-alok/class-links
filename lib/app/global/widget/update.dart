import 'package:flutter/material.dart';
import 'package:in_app_update/in_app_update.dart';

class CheckUpdate extends StatelessWidget {
  final Widget child;
  const CheckUpdate({
    Key? key,
    required this.child,
  }) : super(key: key);

  Future<AppUpdateInfo> checkForUpdate() async =>
      await InAppUpdate.checkForUpdate();

  @override
  Widget build(BuildContext context) => FutureBuilder<AppUpdateInfo>(
        future: checkForUpdate(),
        builder: (context, snapshot) {
          snapshot.data?.updateAvailability ==
                  UpdateAvailability.updateAvailable
              ? InAppUpdate.performImmediateUpdate().catchError(
                  (e) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Error : $e"),
                      )))
              : null;
          return child;
        },
      );
}
