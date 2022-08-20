import 'package:flutter/material.dart';

import '../controller/date_time_controller.dart';

class DateField extends StatelessWidget {
  final DateController controller;
  final String hintText;
  const DateField({required this.hintText, required this.controller, Key? key})
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
                  selectDate(context);
                },
              ),
            ),
          )
        ],
      );

  Future<void> selectDate(BuildContext context) async => await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1947),
        lastDate: DateTime(2024),
      ).then((value) => controller.setDate = value!);
}
