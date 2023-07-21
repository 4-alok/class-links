import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/theme/app_color.dart.dart';
import '../../../services/hive/repository/hive_database.dart';

class ThemeSelector extends StatelessWidget {
  final ScrollController? controller;
  const ThemeSelector({Key? key, this.controller}) : super(key: key);

  HiveDatabase get database => Get.find<HiveDatabase>();

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 75,
        child: Row(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                controller: controller,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: AppColor.schemes.length,
                itemBuilder: (BuildContext context, int index) =>
                    FlexThemeModeOptionButton(
                  optionButtonBorderRadius: 0,
                  height: 35,
                  width: 35,
                  padding: const EdgeInsets.all(.3),
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
