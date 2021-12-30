import 'package:class_link/app/global/theme/app_color.dart.dart';
import 'package:class_link/app/services/local_database.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({Key? key}) : super(key: key);

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

              // controller: scrollController,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: AppColor.schemes.length,
              itemBuilder: (BuildContext context, int index) {
                return FlexThemeModeOptionButton(
                  // optionButtonBorderRadius: widget.controller.useSubThemes
                  //     ? widget.controller.useDefaultRadius
                  //         ? 12
                  //         : widget.controller.cornerRadius
                  //     : 4,
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
                  onSelect: () {
                    database.appTheme.value = AppColor.schemes[index];
                    // scrollController.animateTo(_kWidthOfScrollItem * index,
                    //     duration: const Duration(milliseconds: 350),
                    //     curve: Curves.easeOutCubic);
                    // schemeIndex = index;
                    // widget.controller.setSchemeIndex(index);
                  },
                  selected: database.appTheme.value == AppColor.schemes[index],
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  flexSchemeColor: Get.isDarkMode
                      ? AppColor.schemes[index].dark
                      : AppColor.schemes[index].light,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
