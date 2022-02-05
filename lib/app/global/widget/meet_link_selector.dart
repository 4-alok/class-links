import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum MeetLinkType { googleClassroom, zoomLink }

class MeetLinkController {
  final TextEditingController textController = TextEditingController();

  String get text => textController.text;

  set text(String s) => textController.text = s;
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
        return null;
      } else if (!urlValidator(value)) {
        return 'Please enter a valid Google Classroom link';
      } else {
        return null;
      }
    } else if (meetType == MeetLinkType.zoomLink) {
      if (value == null || value.isEmpty) {
        return null;
      } else if (!urlValidator(value)) {
        return 'Please enter a valid Zoom link';
      } else {
        return null;
      }
    }
    return null;
  }

  bool urlValidator(String url) {
    if (meetType == MeetLinkType.googleClassroom) {
      if (url.startsWith('https://classroom.google.com/')) return true;
      if (url.startsWith('https://meet.google.com/')) return true;
    } else if (meetType == MeetLinkType.zoomLink) {
      if (url.contains('zoom.us') && url.startsWith('https://')) return true;
    }
    return false;
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
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              suffixIcon: IconButton(
                onPressed: _pastText,
                icon: const Icon(Icons.paste),
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
