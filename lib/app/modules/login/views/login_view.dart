import 'package:class_link/app/modules/section_selection/views/section_selection_view.dart';
import 'package:class_link/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeClass.buildTheme(context).primaryColor,
        body: Container(
          padding: EdgeInsets.only(top: 50),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Welcome',
                      style: ThemeClass.buildTheme(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 50, color: Color(0xff510481)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        'Making College life easy',
                        style: ThemeClass.buildTheme(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 25, color: Color(0xff510481)),
                      ),
                    ),
                    SvgPicture.asset(
                      'images/bgimg.svg',
                      width: 600,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(SectionSelectionView());
                      },
                      child: Container(
                        height: 50,
                        width: 250,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              SvgPicture.asset('images/googlelogo.svg'),
                              Text("Sign in with Google",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20))
                            ]),
                        decoration: BoxDecoration(
                          color: Color(0xff510481),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }
}
