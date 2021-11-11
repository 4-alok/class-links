import 'package:flutter/material.dart';

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String s = "Thur";
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              ContainerDay("Mon", s == "Mon", context),
              ContainerDay("Tue", s == "Tue", context),
              ContainerDay("Wed", s == "Wed", context),
              ContainerDay("Thur", s == "Thur", context),
              ContainerDay("Fri", s == "Fri", context),
              ContainerDay("Sat", s == "Sat", context),
              ContainerDay("Sun", s == "Sun", context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget ContainerDay(String s, bool day, context) {
  return Row(
    children: [
      Container(
        width: 45,
        height: 73,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: (day) ? Color(0xff8829C2) : Colors.white,
        ),
        child: Center(
          child: Text(
            s,
            style: (day)
                ? Theme.of(context)
                    .primaryTextTheme
                    .subtitle1!
                    .copyWith(color: Colors.white)
                : Theme.of(context).primaryTextTheme.subtitle1,
          ),
        ),
      ),
      SizedBox(
        width: 30,
      ),
    ],
  );
}
