import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_info_controller.dart';
import 'components/appbar.dart';
import 'components/select_batch.dart';
import 'components/select_year.dart';

class UserInfoView extends GetView<UserInfoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: CustomAppBar(controller: controller),
      ),
      body: PageView(
        controller: controller.pageController,
        physics: BouncingScrollPhysics(),
        onPageChanged: controller.onPageChange,
        children: [
          SelectYear(
            selectYearController: controller.selectYearController,
          ),
          SelectBatch(
            batchController: controller.batchController,
          )
        ],
      ),
      floatingActionButton: fab(),
    );
  }

  FloatingActionButton fab() => FloatingActionButton.extended(
        onPressed: controller.fab,
        label: AnimatedSize(
          duration: Duration(milliseconds: 200),
          child: Obx(
            () => Text(
              (controller.currentPage.value == 0) ? 'Next' : 'Done',
            ),
          ),
        ),
        icon: Obx(
          () => Icon((controller.currentPage.value == 0)
              ? Icons.arrow_forward
              : Icons.done),
        ),
      );
}
