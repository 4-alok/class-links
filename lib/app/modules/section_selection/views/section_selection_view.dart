import 'package:class_link/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/section_selection_controller.dart';
class SectionViewUtils{
  static const Section = ['A', 'B'];
  static const SectionNumber = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30'
  ];
}
class SectionSelectionView extends GetView<SectionSelectionController> {
  int sectionindex = 0;
  int sectionindexnumber = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: ThemeClass.buildTheme(context).primaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    Text('Select your section',
                        style: ThemeClass.buildTheme(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 30, color: Color(0xff510481))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Text(
                            SectionViewUtils.Section[sectionindex],
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Text(
                            SectionViewUtils.SectionNumber[sectionindexnumber],
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: SizedBox(
                              height: 65,
                              width: 100,
                              child: CupertinoPicker(
                                itemExtent: 64,
                                children: SectionViewUtils.Section.map((item) => Center(
                                  child: Text(item,
                                      style: TextStyle(fontSize: 32)),
                                )).toList(),
                                onSelectedItemChanged: (index) {
                                  this.sectionindex = index;
                                  print('$index');
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: SizedBox(
                              height: 65,
                              width: 100,
                              child: CupertinoPicker(
                                itemExtent: 64,
                                children: SectionViewUtils.SectionNumber.map((item) => Center(
                                  child: Text(item,
                                      style: TextStyle(fontSize: 32)),
                                )).toList(),
                                onSelectedItemChanged: (index) {
                                  this.sectionindexnumber = index;
                                  print('$sectionindexnumber');
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(SectionSelectionView());
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 75),
                        child: Container(
                          height: 50,
                          width: 150,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text("Next",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                                Icon(Icons.arrow_forward, color: Colors.white)
                              ]),
                          decoration: BoxDecoration(
                            color: Color(0xff510481),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
