import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hidable/hidable.dart';

import '../controller/app_user_controller.dart';
import 'widgets/search_page.dart';
import 'widgets/user_details_tile.dart';

class AppUserView extends GetView<AppUsersController> {
  const AppUserView({Key? key}) : super(key: key);

  RoundedRectangleBorder get shape =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(0));

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          if (controller.searchController.searchPage.value) {
            controller.searchController.searchPage.value = false;
            controller.searchController.searchTextController.clear();
            controller.searchController.searchList.value = [];
            return false;
          }
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("App Users"),
            actions: [
              IconButton(
                onPressed: () {
                  Get.to(SearchPage(controller: controller));
                },
                // onPressed: () => controller.searchController.searchPage.value =
                //     !controller.searchController.searchPage.value,
                icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
              ),
              const SizedBox(width: 10),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: SizedBox(
                height: 50,
                child: Obx(
                  () => ListView(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    scrollDirection: Axis.horizontal,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: controller.selectedYear.value == null
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColor.withOpacity(.2),
                        ),
                        onPressed: () {
                          controller.selectedBatch.value = null;
                          controller.selectedYear.value = null;
                        },
                        child: Text(
                          "All",
                          style: TextStyle(
                            color: controller.selectedYear.value == null
                                ? Theme.of(context).colorScheme.onPrimary
                                : null,
                          ),
                        ),
                      ),
                      const SizedBox(width: 2),
                      ...List.generate(
                        4,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  controller.selectedYear.value == index + 1
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context)
                                          .primaryColor
                                          .withOpacity(.2),
                            ),
                            onPressed: () {
                              controller.selectedBatch.value = null;
                              controller.selectedYear.value = index + 1;
                            },
                            child: Text("${index + 1} Year",
                                style: TextStyle(
                                  color: controller.selectedYear.value ==
                                          index + 1
                                      ? Theme.of(context).colorScheme.onPrimary
                                      : null,
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: Obx(
            () => controller.searchController.searchPage.value
                ? SearchPage(controller: controller)
                : Column(
                    children: [
                      progressIndicator(),
                      // appBarBottom(context),
                      Flexible(
                        child:
                            GetBuilder<AppUsersController>(builder: (context) {
                          return ListView.builder(
                            controller: controller.scrollController,
                            padding: EdgeInsets.zero,
                            itemCount: controller.getUserList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                                UserDetailsTile(controller.getUserList[index]),
                          );
                        }),
                      )
                      // userList(),
                    ],
                  ),
          ),
          bottomNavigationBar: bottomBar(context),
        ),
      );

  Hidable bottomBar(BuildContext context) => Hidable(
        controller: controller.scrollController,
        wOpacity: false,
        child: GetBuilder<AppUsersController>(
            builder: (_) => Container(
                  height: AppBar().preferredSize.height,
                  color: Theme.of(context).cardColor,
                  child: Row(
                    children: [
                      const SizedBox(width: 15),
                      Obx(
                        () => Text(controller.bottomBarText),
                      ),
                      const Spacer(),
                      controller.selectedBatch.value != null
                          ? IconButton(
                              onPressed: () =>
                                  controller.selectedBatch.value = null,
                              icon: const FaIcon(
                                  FontAwesomeIcons.filterCircleXmark))
                          : IconButton(
                              onPressed: () async => controller
                                      .selectedBatch.value =
                                  await showBatchList(
                                      context,
                                      controller
                                          .batchList(controller.getUserList)),
                              icon: const FaIcon(FontAwesomeIcons.filter),
                            ),
                      IconButton(
                        onPressed: () => showFilterDialog(context),
                        icon: const FaIcon(FontAwesomeIcons.sort),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                )),
      );

  Widget userList() => GetBuilder<AppUsersController>(
      builder: (context) => SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: controller.getUserList.length,
              (context, index) =>
                  UserDetailsTile(controller.getUserList[index]),
            ),
          ));

  PreferredSize appBarBottom(BuildContext context) => PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: Obx(
          () => ListView(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            scrollDirection: Axis.horizontal,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: controller.selectedYear.value == null
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).primaryColor.withOpacity(.2),
                ),
                onPressed: () {
                  controller.selectedBatch.value = null;
                  controller.selectedYear.value = null;
                },
                child: Text(
                  "All",
                  style: TextStyle(
                    color: controller.selectedYear.value == null
                        ? Theme.of(context).colorScheme.onPrimary
                        : null,
                  ),
                ),
              ),
              const SizedBox(width: 2),
              ...List.generate(
                4,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor:
                          controller.selectedYear.value == index + 1
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColor.withOpacity(.2),
                    ),
                    onPressed: () {
                      controller.selectedBatch.value = null;
                      controller.selectedYear.value = index + 1;
                    },
                    child: Text("${index + 1} Year",
                        style: TextStyle(
                          color: controller.selectedYear.value == index + 1
                              ? Theme.of(context).colorScheme.onPrimary
                              : null,
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      );

  SliverAppBar appBar() => SliverAppBar(
        title: const Text("App Users"),
        actions: [
          IconButton(
            onPressed: () => controller.searchController.searchPage.value =
                !controller.searchController.searchPage.value,
            icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
          ),
          const SizedBox(width: 10),
        ],
      );

  Widget progressIndicator() => Obx(() => AnimatedSize(
        duration: const Duration(milliseconds: 500),
        child: controller.loading.value
            ? const LinearProgressIndicator()
            : const SizedBox(),
      ));

  Future<String?> showBatchList(
          BuildContext context, List<BatchInfo> batches) async =>
      await showModal<String>(
        context: context,
        configuration: const FadeScaleTransitionConfiguration(
          transitionDuration: Duration(milliseconds: 300),
        ),
        builder: (BuildContext context) => AlertDiaglogUi(batches: batches),
      );

  Future<void> showFilterDialog(BuildContext context) async =>
      await showModal<String>(
        context: context,
        configuration: const FadeScaleTransitionConfiguration(
          transitionDuration: Duration(milliseconds: 300),
        ),
        builder: (BuildContext context) => AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: filterOptions.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  filterOptions[index],
                ),
                onTap: () => controller.updateFilter(filterOptions[index]),
              ),
            ),
          ),
        ),
      );
}

class AlertDiaglogUi extends StatefulWidget {
  final List<BatchInfo> batches;
  const AlertDiaglogUi({
    required this.batches,
    super.key,
  });

  @override
  State<AlertDiaglogUi> createState() => _AlertDiaglogUiState();
}

class _AlertDiaglogUiState extends State<AlertDiaglogUi> {
  @override
  Widget build(BuildContext context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: EdgeInsets.zero,
        content: SizedBox(
          width: double.maxFinite,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: GroupedListView<BatchInfo, int>(
              elements: widget.batches,
              groupBy: (element) => element.year,
              shrinkWrap: true,
              groupSeparatorBuilder: (groupValue) => Container(
                color: Theme.of(context).primaryColor.withOpacity(.2),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 30),
                  child: Text(
                    '$groupValue Year',
                    // textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ),
              itemBuilder: (context, element) => ListTile(
                title: Text(element.batch),
                trailing: Text(element.count.toString()),
                onTap: () => Get.back<String>(result: element.batch),
              ),
              order: GroupedListOrder.DESC,
            ),
          ),
        ),
      );
}
