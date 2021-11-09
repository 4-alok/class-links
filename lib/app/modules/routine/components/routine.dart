import 'package:class_link/app/modules/todo/views/todo_view.dart';
import '../../todo/views/todo_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class RoutineWidget extends StatelessWidget {
  const RoutineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: GestureDetector(
        onTap: () {
          Get.to(AddingPage());
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
          decoration: BoxDecoration(
              color: Color(0xff8829C2),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  offset: Offset(2, 2),
                  blurRadius: 2,
                  color: Color(0xff510481),
                ),
                BoxShadow(
                  offset: Offset(-2, 2),
                  blurRadius: 1,
                  color: Color(0xff510481),
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
                    'AEC',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headline6!
                        .copyWith(color: Colors.white),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1pm - 2pm',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headline6!
                        .copyWith(color: Colors.white),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
