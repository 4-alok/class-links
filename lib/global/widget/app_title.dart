import 'package:flutter/material.dart';

class AppTitleWidget extends StatelessWidget {
  final double fontSize;
  const AppTitleWidget({
    Key? key,
    this.fontSize = 30,
  }) : super(key: key);

  static Widget flightShuttleBuilder(
    BuildContext flightContext,
    Animation<double> animation,
    HeroFlightDirection flightDirection,
    BuildContext fromHeroContext,
    BuildContext toHeroContext,
  ) =>
      DefaultTextStyle(
        style: DefaultTextStyle.of(toHeroContext).style,
        child: toHeroContext.widget,
      );

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Class",
              style: TextStyle(fontSize: fontSize),
            ),
            Text(
              " Link",
              style: TextStyle(
                fontSize: fontSize,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).primaryColor,
              ),
            )
          ],
        ),
      );
}
