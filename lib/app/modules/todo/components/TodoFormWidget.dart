import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;
  const TodoFormWidget(
      {this.title = '',
      this.description = '',
      required this.onChangedTitle,
      required this.onSavedTodo,
      required this.onChangedDescription});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTitle(),
            SizedBox(
              height: 8,
            ),
            buildDescription(),
            SizedBox(
              height: 32,
            ),
            buildbutton(context),
          ],
        ),
      );
  Widget buildTitle() => TextFormField(
        maxLines: 2,
        initialValue: title,
        onChanged: onChangedTitle,
        validator: (title) {
          if (title!.isEmpty) {
            return 'Title cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Title',
        ),
      );
  Widget buildDescription() => TextFormField(
        maxLines: 1,
        initialValue: description,
        onChanged: onChangedTitle,
        validator: (title) {
          if (title!.isEmpty) {
            return 'Title cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Time',
        ),
      );
  Widget buildbutton(context) => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            onPressed: onSavedTodo,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xff8829C2)),
            ),
            child: Text(
              'Save',
              style: Theme.of(context).primaryTextTheme.button,
            )),
      );
}
