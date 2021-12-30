import 'package:class_link/app/modules/user_info/controllers/user_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectYearController {
  final currentYear = Rx<int?>(null);

  void dispose() => currentYear.close();
}

class SelectYear extends StatelessWidget {
  final SelectYearController selectYearController;
  const SelectYear({
    Key? key,
    required this.selectYearController,
  }) : super(key: key);

  void nextPage() => Get.find<UserInfoController>().nextPage();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => buildLIst(selectYearController.currentYear.value ?? -1),
    );
  }

  ListView buildLIst(int selectedYear) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 2,
      itemBuilder: (context, index) => Card(
        color: selectedYear == index + 1
            ? Theme.of(context).primaryColor
            : Theme.of(context).cardColor,
        child: ListTile(
          title: Text('Year ${index + 1}'),
          onTap: () => selectYearController.currentYear.value = index + 1,
        ),
      ),
    );
  }
}
