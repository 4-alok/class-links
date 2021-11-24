import 'package:class_link/app/global/widget/time_selector.dart';
import 'package:class_link/app/models/time_table/time_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditBottomSheet {
  final _subjectNameController = TextEditingController();
  final _remarkController = TextEditingController();
  final _dayTimeController = TimeFieldController();

  Future<Subject?> show(BuildContext context) async =>
      await showModalBottomSheet<Subject>(
        isScrollControlled: true,
        context: context,
        builder: (context) => Container(
          padding: EdgeInsets.only(
            top: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 10,
            right: 10,
          ),
          child: ListView(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              TextFormField(
                controller: _subjectNameController,
                decoration: InputDecoration(
                  border: curvedBox(),
                  filled: true,
                  hintText: "Subject",
                ),
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _remarkController,
                maxLines: 3,
                decoration: InputDecoration(
                  border: curvedBox(),
                  filled: true,
                  hintText: "Remark",
                ),
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: 10),
              SelectTimeFIeld(
                dayTimeController: _dayTimeController,
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: need validation
                    final sub = Subject(
                      subjectName: _subjectNameController.text,
                      remark: _remarkController.text,
                      startTime: DayTime(
                        hour: _dayTimeController.dayTime?.hour ?? 0,
                        minute: _dayTimeController.dayTime?.minute ?? 0,
                      ),
                    );
                    Navigator.pop(context, sub);
                  },
                  child: Text("done"),
                ),
              )
            ],
          ),
        ),
      );

  void dispose() {
    _subjectNameController.dispose();
    _remarkController.dispose();
    _dayTimeController.dispose();
  }

  static OutlineInputBorder curvedBox() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      );
}
