import 'package:flutter/material.dart';

import '../controller/date_time_controller.dart';

class TimeField extends StatelessWidget {
  final TimeController controller;
  final String hintText;
  const TimeField({required this.hintText, required this.controller, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          TextFormField(
            controller: controller.dateTimeTextController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                hintText: hintText),
            textInputAction: TextInputAction.next,
          ),
          Positioned.fill(
            child: Container(
              color: Colors.transparent,
              child: InkWell(
                radius: 8.0,
                onTap: () {
                  FocusScope.of(context).unfocus();
                  selectTime(context);
                },
              ),
            ),
          )
        ],
      );

  Future<void> selectTime(BuildContext context) async => await showTimePicker(
        initialTime: TimeOfDay.now(),
        context: context,
      ).then((value) => controller.setTime = DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            value!.hour,
            value.minute,
          ));
}
