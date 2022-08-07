import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../global/theme/app_color.dart.dart';
import '../../../../../services/hive/repository/hive_database.dart';
import '../../controllers/profile_controller.dart';

class ThemeSelector extends StatelessWidget {
  final ProfileController controller;
  const ThemeSelector({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final database = Get.find<HiveDatabase>();
    return SizedBox(
      height: 65,
      child: Row(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              controller: controller.scrollController,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: AppColor.schemes.length,
              itemBuilder: (BuildContext context, int index) =>
                  FlexThemeModeOptionButton(
                optionButtonBorderRadius: 12,
                height: 30,
                width: 30,
                padding: const EdgeInsets.all(0.3),
                optionButtonMargin: EdgeInsets.zero,
                borderRadius: 0,
                unselectedBorder: BorderSide.none,
                selectedBorder: BorderSide(
                  color: Theme.of(context).primaryColorLight,
                  width: 4,
                ),
                onSelect: () => database.settingBoxDatasources
                    .saveCurrentSchemeIndex(index),
                selected: database.settingBoxDatasources.appTheme.value ==
                    AppColor.schemes[index],
                backgroundColor: Theme.of(context).colorScheme.surface,
                flexSchemeColor: Get.isDarkMode
                    ? AppColor.schemes[index].dark
                    : AppColor.schemes[index].light,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
