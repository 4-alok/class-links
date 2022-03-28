import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/extension.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../global/const/holiday_list.dart';
import '../../utils/utils.dart';

class HolidaysView extends StatelessWidget {
  const HolidaysView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final color = Color.alphaBlend(
        Theme.of(context)
            .colorScheme
            .primary
            .withAlpha(5 * (Get.isDarkMode ? 4 : 3)),
        Theme.of(context).cardColor);
    final today = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const FaIcon(
            FontAwesomeIcons.arrowLeft,
          ),
          onPressed: () => Get.back(),
        ),
        title: const Text('Holidays'),
        centerTitle: true,
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: holidayList.length,
        itemBuilder: (BuildContext context, int index) => Card(
          child: ListTile(
            tileColor: holidayList[index].toDateTime.isBefore(today)
                ? Colors.transparent
                : color,
            minLeadingWidth: 0,
            leading: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.transparent,
              child: Text((index + 1).toString()),
            ),
            title: Text(holidayList[index].name),
            trailing: Text(
              Utils.formateDate(holidayList[index].toDateTime, true),
            ),
          ),
        ),
      ),
    );
  }

  k() {
    return TextField(onChanged: (val) {});
  }
}
