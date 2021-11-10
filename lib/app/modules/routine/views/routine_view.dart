import '../components/AddingRutineFormWidget.dart';
import '../components/CategoriesScroller.dart';
import '../components/routine.dart';
import 'package:flutter/material.dart';

class RoutinePage extends StatefulWidget {
  const RoutinePage({Key? key}) : super(key: key);

  @override
  _RoutinePageState createState() => _RoutinePageState();
}

class _RoutinePageState extends State<RoutinePage> {
  String title = '';
  String description = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 25, 0, 10),
          child: Text(
            'Schedule',
            style: Theme.of(context).primaryTextTheme.headline4,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 10, 10),
            child: IconButton(
              icon: Icon(
                Icons.add,
                size: 39,
              ),
              onPressed: () => showDialog(
                context: context,
                builder: (BuildContext) => AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add Subject',
                        style: Theme.of(context).primaryTextTheme.headline6,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      AddingRutineFormWidget(
                        onChangedTitle: (title) => setState(() {
                          this.title = title;
                        }),
                        onChangedDescription: (description) => setState(() {
                          this.description = description;
                        }),
                        onSavedTodo: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          CategoriesScroller(),
          RoutineWidget(),
          RoutineWidget(),
          RoutineWidget(),
        ],
      ),
    );
  }
}
