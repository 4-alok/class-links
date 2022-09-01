import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/cache_testing.dart';
import '../widget/common_widget.dart';

class CacheTest extends StatefulWidget {
  const CacheTest({Key? key}) : super(key: key);

  @override
  State<CacheTest> createState() => _CacheTestState();
}

class _CacheTestState extends State<CacheTest> with TestWidget {
  final controller = CacheTestingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => testCard(
        testTitle: "Cache Testing",
        child: Wrap(
          spacing: 5,
          children: [
            logText(),
            ElevatedButton(
              onPressed: () => controller.isCacheBoxEmpty,
              child: const Text("isCache null"),
            ),
            ElevatedButton(
              onPressed: () => controller.addCacheData,
              child: const Text("Add Cache Data"),
            ),
            ElevatedButton(
              onPressed: () => controller.deleteCacheData,
              child: const Text("Delete cache data"),
            ),
            ElevatedButton(
              onPressed: () => controller.isCacheExpired,
              child: const Text("isExpired"),
            ),
            ElevatedButton(
              onPressed: () => controller.makeCacheExpired,
              child: const Text("Make Expired"),
            ),
          ],
        ),
      );

  Widget logText() => Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(10)),
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Text(
                    "cache data : ${controller.isEmpty.value == null ? "No Data" : controller.isEmpty.value! ? "Empty" : "Not Empty"}",
                    style: const TextStyle(color: Colors.white)),
              ),
              Obx(
                () => Text(
                    "is expired : ${controller.isExpired.value == null ? "No Data" : controller.isExpired.value! ? "Expired" : "Not Expired"}",
                    style: const TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      );
}
