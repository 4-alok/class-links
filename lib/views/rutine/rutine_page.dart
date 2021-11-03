import 'package:class_link/widgets/rutine_widget/AddingRutineFormWidget.dart';
import 'package:class_link/widgets/rutine_widget/CategoriesScroller.dart';
import 'package:class_link/widgets/rutine_widget/rutine.dart';
import 'package:flutter/material.dart';

class rutinePage extends StatefulWidget {
  const rutinePage({Key? key}) : super(key: key);

  @override
  _rutinePageState createState() => _rutinePageState();
}

class _rutinePageState extends State<rutinePage> {
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
          rutineWidget(),
          rutineWidget(),
          rutineWidget(),
        ],
      ),
    );
  }
}
