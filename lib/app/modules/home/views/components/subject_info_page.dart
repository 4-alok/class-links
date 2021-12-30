import 'package:class_link/app/models/time_table/time_table.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            icon: const FaIcon(FontAwesomeIcons.chevronLeft),
            color: Theme.of(context).appBarTheme.actionsIconTheme?.color ??
                Colors.white,
          ),
          title: Text(subject.subjectName),
        ),
        body: const Center(
          child: Text('Subject Info'),
        ),
      );
}
