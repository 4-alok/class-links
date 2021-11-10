import 'package:class_link/app/modules/routine/views/routine_view.dart';
import 'package:class_link/app/routes/app_pages.dart';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class serverWidget extends StatelessWidget {
  const serverWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 4,
                color: Color(0x4C767679),
              ),
              BoxShadow(
                offset: Offset(-2, 4),
                blurRadius: 4,
                color: Color(0x4C767679),
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Server',
                  style: Theme.of(context).primaryTextTheme.headline6,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Created By',
                  style: Theme.of(context).primaryTextTheme.subtitle1,
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Participants : 10',
                  style: Theme.of(context).primaryTextTheme.subtitle1,
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Get.to(RoutinePage());
                        },
                        child: Text('Join'),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xff8829C2)))),
                    SizedBox(
                      width: 4,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Get.toNamed(Routes.ROUTINE);
                        },
                        child: Text('View'),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xff8829C2))))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
