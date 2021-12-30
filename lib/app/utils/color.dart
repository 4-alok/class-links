import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlendColor {
  static Color boldTitle(BuildContext context, Color color) {
    final theme = Theme.of(context);
    return theme.colorScheme.secondaryVariant.value ==
            theme.appBarTheme.backgroundColor!.value
        ? theme.secondaryHeaderColor
        : theme.primaryColorLight;
  }

  static Color cardColor(BuildContext context) => Color.alphaBlend(
      Theme.of(context)
          .colorScheme
          .primary
          .withAlpha(5 * (Get.isDarkMode ? 4 : 3)),
      Theme.of(context).cardColor);
}
