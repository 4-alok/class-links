import 'dart:math';

import '../../controllers/subject_info_controller.dart';
import 'package:day_night_time_picker/lib/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class SubjectInfoAppBar extends StatelessWidget {
  const SubjectInfoAppBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SubjectInfoController controller;

  @override
  Widget build(BuildContext context) => SliverAppBar(
        expandedHeight: 200,
        pinned: true,
        snap: true,
        floating: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const FaIcon(FontAwesomeIcons.arrowLeft),
        ),
        flexibleSpace: FlexibleSpaceBar(
          background: sunMoonWidget(),
          title: Hero(
            tag: "subject_name",
            child: Text(
              controller.subject.subjectName,
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ),
      );

  Widget sunMoonWidget() => Container(
      color: (Get.isDarkMode)
          ? Get.theme.primaryColor
          : Get.theme.secondaryHeaderColor,
      height: 150,
      width: Get.width,
      child: LayoutBuilder(builder: (context, constraints) {
        final maxWidht = constraints.maxWidth.round() - 100;
        final displace = mapRange(controller.hour.value * 1.0, 0, 23);
        final top = sin(pi * displace) * 1.8;
        final left = maxWidht * displace;
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Obx(
              () => AnimatedPositioned(
                bottom: top * 20,
                left: left,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: SizedBox(
                  width: 100,
                  child: AnimatedSwitcher(
                    switchInCurve: Curves.ease,
                    switchOutCurve: Curves.ease,
                    duration: const Duration(milliseconds: 250),
                    child: controller.isDay
                        ? Container(
                            key: const ValueKey(1),
                            child: const Image(
                              image: AssetImage(
                                "packages/day_night_time_picker/assets/sun.png",
                              ),
                            ))
                        : Container(
                            key: const ValueKey(2),
                            child: const Image(
                              image: AssetImage(
                                  "packages/day_night_time_picker/assets/moon.png"),
                            ),
                          ),
                    transitionBuilder: (child, anim) => ScaleTransition(
                      scale: anim,
                      child: FadeTransition(
                        opacity: anim,
                        child: SlideTransition(
                          position: anim.drive(
                            Tween(
                                begin: const Offset(0, 4),
                                end: const Offset(0, 0)),
                          ),
                          child: child,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      }));
}
