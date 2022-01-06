import 'package:flutter/material.dart';
import 'package:class_link/app/utils/color.dart';

class AppTitleWidget extends StatelessWidget {
  final double fontSize;
  const AppTitleWidget({
    Key? key,
    this.fontSize = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Text.rich(
        TextSpan(
          text: 'Class',
          children: [
            TextSpan(
              text: ' Link ',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.secondaryVariant.value ==
                        Theme.of(context).appBarTheme.backgroundColor!.value
                    ? BlendColor.boldTitle(
                        context, Theme.of(context).colorScheme.primary)
                    : BlendColor.boldTitle(context,
                        Theme.of(context).colorScheme.secondaryVariant),
              ),
            ),
          ],
        ),
        style: TextStyle(fontSize: fontSize),
      );
}
