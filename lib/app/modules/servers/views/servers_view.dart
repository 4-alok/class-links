import '../components/server_package.dart';
import 'package:flutter/material.dart';


class ServerPage extends StatefulWidget {
  const ServerPage({Key? key}) : super(key: key);

  @override
  _ServerPageState createState() => _ServerPageState();
}

class _ServerPageState extends State<ServerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              ' Servers',
              style: Theme.of(context).primaryTextTheme.headline4,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 15, 10),
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff8829C2))),
                onPressed: () {},
                child: Text(
                  'Create',
                  style: Theme.of(context).primaryTextTheme.button,
                )),
          )
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
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Name',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .subtitle1!
                                .copyWith(color: Colors.white)),
                        SizedBox(
                          height: 18,
                        ),
                        Text('Email',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .subtitle1!
                                .copyWith(color: Colors.white)),
                        SizedBox(
                          height: 18,
                        ),
                        Text('Section',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .subtitle1!
                                .copyWith(color: Colors.white)),
                      ],
                    )
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
            child: Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("View",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline5!
                          .copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          )),
                ),
              ],
            ),
          ),
          serverWidget(),
          serverWidget(),
          serverWidget(),
          serverWidget(),
        ],
      ),
    );
  }
}
