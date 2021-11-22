import 'package:class_link/app/modules/user_info/controllers/user_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BatchController {
  final slot = Rx<int?>(null);
  final batch = Rx<String?>(null);

  void dispose() {
    slot.close();
    batch.close();
  }
}

class SelectBatch extends StatelessWidget {
  final BatchController batchController;
  const SelectBatch({
    Key? key,
    required this.batchController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        selectSlot(context),
        selectBatch(context),
      ],
    );
  }

  Widget selectBatch(BuildContext context) {
    final userInfoController = Get.find<UserInfoController>();
    final currentYear = userInfoController.selectYearController.currentYear;
    return Obx(() {
      if (currentYear.value == null) {
        return ListTile(title: Text("Select you year first"));
      } else {
        if (currentYear.value == 1) {
          return batchList(userInfoController.list1);
        } else if (currentYear.value == 2) {
          return batchList(userInfoController.list2);
        } else {
          throw Exception('Invalid year');
        }
      }
    });
  }

  Widget batchList(List<String> _batchList) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _batchList.length,
      itemBuilder: (context, index) {
        return Obx(
          () => Card(
            color: batchController.batch.value == _batchList[index]
                ? Theme.of(context).secondaryHeaderColor
                : null,
            child: ListTile(
              title: Text(_batchList[index]),
              onTap: () => batchController.batch.value = _batchList[index],
            ),
          ),
        );
      },
    );
  }

  Widget selectSlot(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Scheme/Slot',
                style: Theme.of(context).textTheme.subtitle1,
              )),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: List.generate(
                2,
                (index) => Flexible(
                      child: Obx(
                        () => Card(
                          color: batchController.slot.value == index + 1
                              ? Theme.of(context).secondaryHeaderColor
                              : null,
                          child: ListTile(
                            title: Text("${index + 1}"),
                            onTap: () => batchController.slot.value = index + 1,
                          ),
                        ),
                      ),
                    )),
          ),
        ]);
  }
}
