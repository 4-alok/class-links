import 'dart:ui';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const amount = 50;

class FrostCard extends StatelessWidget {
  const FrostCard({
    this.margin = const EdgeInsets.all(5.0),
    this.padding = const EdgeInsets.all(0),
    this.radius = 10,
    this.transparent = false,
    this.selected = false,
    this.sigma = 3.0,
    this.borderColor,
    required this.child,
    super.key,
  });
  final bool selected;
  final Widget child;
  final double sigma;
  final double radius;
  final EdgeInsetsGeometry margin;
  final bool transparent;
  final EdgeInsetsGeometry padding;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) => Padding(
        padding: margin,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
            child: Container(
              padding: padding,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                border: Border.all(
                  color: borderColor ?? Colors.transparent,
                  width: selected ? 2 : 1,
                ),
                color: transparent
                    ? Colors.transparent
                    : selected
                        ? selectedCardColor
                        : cardColor,
              ),
              child: child,
            ),
          ),
        ),
      );

  static Color get cardColor =>
      Get.theme.primaryColor.blend(Colors.black, amount).withOpacity(.3);

  static Color get selectedCardColor => Get.isDarkMode
      ? Get.theme.primaryColor
      : Get.theme.primaryColor.blend(Colors.black, amount).withOpacity(.8);
}
