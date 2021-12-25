import 'package:class_link/app/global/widget/meet_link_selector.dart';
import 'package:class_link/app/global/widget/time_selector.dart';
import 'package:class_link/app/models/time_table/time_table.dart';
import 'package:flutter/material.dart';

class EditBottomSheet {
  final _subjectNameController = TextEditingController();
  final _remarkController = TextEditingController();
  final _dayTimeController = TimeFieldController();
  final _gMeetLinkController = MeetLinkController();
  final _zMeetLinkController = MeetLinkController();

  Future<Subject?> show(BuildContext context, Subject? subject) async {
    if (subject != null) {
      _subjectNameController.text = subject.subjectName;
      _remarkController.text = subject.remark;
      _dayTimeController.setTime(
          context,
          TimeOfDay(
              minute: subject.startTime.minute, hour: subject.startTime.hour));
    }
    return await showModalBottomSheet<Subject>(
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
          physics: const BouncingScrollPhysics(),
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
            const SizedBox(height: 10),
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
            const SizedBox(height: 10),
            MeetLinkSelector(
              meetType: MeetLinkType.googleClassroom,
              controller: _gMeetLinkController,
            ),
            const SizedBox(height: 10),
            MeetLinkSelector(
              meetType: MeetLinkType.zoomLink,
              controller: _zMeetLinkController,
            ),
            const SizedBox(height: 10),
            SelectTimeFIeld(
              dayTimeController: _dayTimeController,
            ),
            const SizedBox(height: 10),
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
                child: const Text("done"),
              ),
            )
          ],
        ),
      ),
    );
  }

  void dispose() {
    _subjectNameController.dispose();
    _remarkController.dispose();
    _dayTimeController.dispose();
  }

  static OutlineInputBorder curvedBox() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      );
}
