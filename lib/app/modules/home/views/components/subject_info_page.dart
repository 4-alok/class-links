import 'package:class_link/app/models/time_table/time_table.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';

class SubjectInfo extends StatelessWidget {
  final Subject subject;

  const SubjectInfo({
    Key? key,
    required this.subject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const FaIcon(FontAwesomeIcons.arrowLeft),
          ),
          title: Text(
            subject.subjectName,
            style: TextStyle(
              fontSize: 40,
              fontWeight: Get.textTheme.headline6!.fontWeight,
            ),
          ),
        ),
        body: Theme(
          data: Get.theme.copyWith(
            cardColor: Color.alphaBlend(
                Get.theme.colorScheme.primary
                    .withAlpha(5 * (Get.isDarkMode ? 4 : 3)),
                Get.theme.cardColor),
          ),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            children: [
              Card(
                elevation: 3,
                child: ListTile(
                  title: const Text("Google Meet"),
                  subtitle: Text(subject.gLinkAddBy.split(",").first),
                  trailing: Text(subject.googleClassRoomLink),
                ),
              ),
              Card(
                elevation: 3,
                child: ListTile(
                  title: const Text("Zoom Meet"),
                  subtitle: Text(subject.zLinkAddBy.split(",").first),
                  trailing: Text(subject.zoomLink),
                ),
              ),
              Card(
                elevation: 3,
                child: ListTile(
                  title: const Text("Room No"),
                  subtitle: Text(subject.roomNoAddBy.split(",").first),
                  trailing: Text(
                    subject.roomNo == null
                        ? "Not Available"
                        : subject.roomNo.toString(),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
