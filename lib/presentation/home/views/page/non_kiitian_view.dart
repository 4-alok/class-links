import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NonKiitianView extends StatelessWidget {
  const NonKiitianView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: double.maxFinite,
        margin: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: const [
            FaIcon(FontAwesomeIcons.faceDizzy, size: 130),
            SizedBox(height: 80),
            Text(
              "We apologise, this app is not available for you",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
}
