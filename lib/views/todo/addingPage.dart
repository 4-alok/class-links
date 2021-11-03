import 'package:class_link/widgets/todo_widget/TodoFormWidget.dart';
import 'package:flutter/material.dart';

class AddingPage extends StatefulWidget {
  @override
  State<AddingPage> createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {
  int selectedIndex = 0;
  String title = '';
  String description = '';
  get builder => null;

  @override
  Widget build(BuildContext context) {
    final tabs = [Container(), Container()];
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 25, 0, 10),
          child: Text(
            'AEC',
            style: Theme.of(context).primaryTextTheme.headline4,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff8829C2),
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fact_check_outlined,
            ),
            label: 'Todos',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.done,
              size: 28,
            ),
            label: 'Completed',
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xff8829C2),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(2, 2),
                    blurRadius: 1,
                    color: Color(0xff43036a),
                  ),
                  BoxShadow(
                    offset: Offset(-2, 2),
                    blurRadius: 2,
                    color: Color(0xff43036a),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Class Link',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .headline5!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100),
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.edit,
                                color: Colors.white,
                              )),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.copy_outlined,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: Text(
                      'Join Now',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .button!
                          .copyWith(color: Color(0xff8829C2)),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
            child: Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Todo",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline5!
                          .copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          )),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(icon: Icon(Icons.add), onPressed: () {}),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (BuildContext) => AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add Todo',
                  style: Theme.of(context).primaryTextTheme.headline6,
                ),
                const SizedBox(
                  height: 8,
                ),
                TodoFormWidget(
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
        child: Icon(Icons.add),
      ),
    );
  }
}

//tabs[selectedIndex]
