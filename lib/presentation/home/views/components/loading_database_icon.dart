import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../services/gsheet/repository/gsheet_service.dart';

class LoadingDatabaseIcon extends StatelessWidget {
  final Widget? icon;
  const LoadingDatabaseIcon({this.icon, Key? key}) : super(key: key);

  GSheetService get gSheetServece => Get.find<GSheetService>();

  @override
  Widget build(BuildContext context) => Center(
          child: Tooltip(
        message: 'Updating Database',
        child: Obx(
          () => AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: gSheetServece.spreadsheetLoaded.value
                ? icon ?? const SizedBox()
                : loadingWidget(context),
          ),
        ),
      ));

  Stack loadingWidget(BuildContext context) => Stack(
        children: [
          FaIcon(
            FontAwesomeIcons.cloud,
            color: Theme.of(context).primaryColor.withAlpha(100),
          ),
          const Positioned(
            right: 10,
            bottom: 5,
            child: SizedBox(
              height: 10,
              width: 10,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          )
        ],
      );
}
