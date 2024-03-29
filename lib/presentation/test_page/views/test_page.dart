import 'pages/auth_test.dart';
import 'pages/database_utils.dart';
import 'pages/sheet_test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(),
        body: Theme(
          data: Theme.of(context).copyWith(
              cardColor: Color.alphaBlend(
                  Theme.of(context)
                      .colorScheme
                      .primary
                      .withAlpha(5 * (Get.isDarkMode ? 4 : 3)),
                  Theme.of(context).cardColor)),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            children: const [
              AuthTest(),
              // UserTestPage(),
              // ResourcesTest(),
              DatabaseUtils(),
              // CacheTest(),
              SheetTest(),
            ],
          ),
        ),
      );

  AppBar appBar() => AppBar(
        centerTitle: true,
        title: const Text("Test Page"),
      );
}
