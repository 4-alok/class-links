import 'package:class_link/app/models/time_table/time_table.dart';
import 'package:flutter/material.dart';

class SubjectInfo extends StatelessWidget {
  final Subject subject;
  
  const SubjectInfo({
    Key? key,
    required this.subject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(subject.subjectName),
      ),
      body: const Center(
        child: Text('Subject Info'),
      ),
    );
}
