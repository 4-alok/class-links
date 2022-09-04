import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/cache_test.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

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
              CacheTest(),
            ],
          ),
        ),
      );

  AppBar appBar() => AppBar(
        centerTitle: true,
        title: const Text("Test Page"),
      );
}