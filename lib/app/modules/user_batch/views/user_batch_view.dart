import 'package:class_link/app/global/widget/app_title.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/user_batch_controller.dart';

class UserBatchView extends GetView<UserBatchController> {
  const UserBatchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Hero(
            tag: "app_logo",
            child: Material(child: AppTitleWidget()),
          )),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          title(context, "Select Year"),
          selectYearWidget(context),
          selectSchemeTitle(context),
          selectScheme(context),
          selectBatchTitle(context),
          batchList,
        ],
      ),
      floatingActionButton: fab(context),
    );
  }

  Widget fab(BuildContext context) => Obx(
        () => !controller.showSubmitButton
            ? const SizedBox()
            : FloatingActionButton.extended(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Caution'),
                      content: const Text('Once selected cannot be changed'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel')),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              controller.submit();
                            },
                            child: const Text('Confirm')),
                      ],
                    ),
                  );
                },
                icon: controller.loading.value
                    ? const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      )
                    : const FaIcon(FontAwesomeIcons.check),
                label: AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: controller.loading.value
                      ? const SizedBox()
                      : const Text("Submit"),
                ),
              ),
      );

  Widget get batchList => Obx(
        () => ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(8),
          shrinkWrap: true,
          itemCount: controller.batchList.length,
          itemBuilder: (context, index) => Obx(
            () => Card(
              color:
                  controller.currentBatch.value == controller.batchList[index]
                      ? selectedCardColor
                      : cardColor,
              child: ListTile(
                title: Text(controller.batchList[index]),
                onTap: () =>
                    controller.currentBatch.value = controller.batchList[index],
              ),
            ),
          ),
        ),
      );

  Widget selectBatchTitle(BuildContext context) =>
      Obx(() => controller.currentScheme.value != null
          ? title(context, "Select Batch")
          : const SizedBox());

  Widget selectSchemeTitle(BuildContext context) =>
      Obx(() => controller.currentYear.value == 1
          ? title(context, "Select Scheme")
          : const SizedBox());

  Widget selectYearWidget(BuildContext context) => AnimatedSize(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 300),
        child: Obx(
          () => GridView.count(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(10),
            crossAxisCount: 2,
            childAspectRatio: controller.currentYear.value == null ? 1 : 2,
            children: List.generate(2, (index) {
              return Obx(
                () => Card(
                  color: controller.currentYear.value == index + 1
                      ? selectedCardColor
                      : cardColor,
                  child: InkWell(
                    onTap: () {
                      controller.currentYear.value = index + 1;
                      controller.currentBatch.value = null;
                    },
                    child: Center(
                      child: Text.rich(
                        TextSpan(
                          text: (index + 1).toString(),
                          children: [
                            TextSpan(
                              text: intPostfix(index + 1),
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const TextSpan(
                              text: " Year",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      );

  Widget select(BuildContext context) => Obx(
        () => GridView.count(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(10),
          crossAxisCount: 2,
          childAspectRatio: controller.currentYear.value == null ? 1 : 1.5,
          children: List.generate(2, (index) {
            return Card(
              color: controller.currentScheme.value == index
                  ? selectedCardColor
                  : cardColor,
              child: InkWell(
                onTap: () => controller.currentScheme.value = index,
                child: Center(
                  child: Text(
                    (index + 1).toString(),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
            );
          }),
        ),
      );

  Widget selectScheme(BuildContext context) => Obx(
        () => controller.currentYear.value == 1
            ? AnimatedSize(
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 300),
                child: Obx(
                  () => GridView.count(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(10),
                    crossAxisCount: 2,
                    childAspectRatio:
                        controller.currentScheme.value == null ? 1 : 2,
                    children: List.generate(2, (index) {
                      return Obx(
                        () => Card(
                          color: controller.currentScheme.value == index + 1
                              ? selectedCardColor
                              : cardColor,
                          child: InkWell(
                            onTap: () =>
                                controller.currentScheme.value = index + 1,
                            child: Center(
                              child: Text(
                                (index + 1).toString(),
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              )
            : const SizedBox(),
      );

  String intPostfix(int i) => i == 1
      ? " st"
      : i == 2
          ? " nd"
          : i == 3
              ? " rd"
              : " th";

  Widget title(BuildContext context, String title) => Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Text(
          title,
          style: Get.theme.textTheme.headline4!.copyWith(
            color: Get.theme.textTheme.headline4!.color!.withOpacity(0.5),
          ),
        ),
      );

  Color get cardColor => Color.alphaBlend(
      Get.theme.colorScheme.primary.withAlpha(5 * (Get.isDarkMode ? 4 : 3)),
      Get.theme.cardColor);

  Color get selectedCardColor {
    return Get.isDarkMode
        ? Get.theme.primaryColor
        : Get.theme.primaryColor.withOpacity(.8);
  }
}
