import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum MeetLinkType { googleClassroom, zoomLink }

class MeetLinkController {
  final TextEditingController textController = TextEditingController();
}

class MeetLinkSelector extends StatelessWidget {
  final MeetLinkController controller;
  final MeetLinkType meetType;

  const MeetLinkSelector({
    Key? key,
    required this.controller,
    required this.meetType,
  }) : super(key: key);

  String? validation(String? value) {
    if (meetType == MeetLinkType.googleClassroom) {
      if (value == null || value.isEmpty) {
        return 'Please enter a Google Classroom link';
      } else if (!value.startsWith('https://classroom.google.com/c/')) {
        return 'Please enter a valid Google Classroom link';
      } else
        return null;
    } else if (meetType == MeetLinkType.zoomLink) {
      if (value == null || value.isEmpty) {
        return 'Please enter a Zoom link';
      } else if (!value.startsWith('https://zoom.us/')) {
        return 'Please enter a valid Zoom link';
      } else
        return null;
    }
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          TextFormField(
            controller: controller.textController,
            maxLines: 1,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              suffixIcon: IconButton(
                onPressed: _pastText,
                icon: Icon(Icons.paste),
              ),
              filled: true,
              hintText:
                  "Past ${meetType == MeetLinkType.googleClassroom ? "google classroom" : "zoom"} Link",
            ),
            validator: validation,
          ),
        ],
      );

  void _pastText() async {
    final k = await Clipboard.getData("text/plain");
    if (k != null && k.text != null) {
      controller.textController.text = k.text!;
    }
  }
}
