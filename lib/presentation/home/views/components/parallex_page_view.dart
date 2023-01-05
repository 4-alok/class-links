// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../services/auth/models/user_type.dart';
import '../../../../services/auth/repository/auth_service_repo.dart';
import '../../../resources/controller/resources_controller.dart';
import '../../controllers/home_controller.dart';
import '../../model/background_parameter.dart';

part '../../controllers/parallex_page_controller.dart';

class ParallexPageView extends StatefulWidget {
  final List<Widget> children;
  final Parameter backgroundParameter;
  final HomeController controller;
  const ParallexPageView(
      {Key? key,
      required this.children,
      required this.backgroundParameter,
      required this.controller})
      : super(key: key);

  @override
  State<ParallexPageView> createState() => ParallexPageViewState();
}

class ParallexPageViewState extends State<ParallexPageView>
    with TickerProviderStateMixin {
  final ParallexPageController controller = ParallexPageController();

  @override
  void initState() {
    controller.init(this, widget.controller.pageController);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  UserType get userType => Get.find<AuthService>().authDatasources.userType();

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          background(context),
          svgAnimation(context),
          body(context),
        ],
      );

  Widget background(BuildContext context) => SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ColoredBox(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      );

  Widget svgAnimation(BuildContext context) => Positioned(
        bottom: 0,
        right: widget.backgroundParameter.left -
            (MediaQuery.of(context).size.width / 1.2),
        child: AnimatedBuilder(
            animation: controller.slideAnimationController,
            builder: ((context, child) => Transform.translate(
                  offset: Offset(
                      -controller.shiftSize *
                          controller.slideAnimationController.value *
                          1.2,
                      0),
                  child: child ?? const SizedBox(),
                )),
            child: AnimatedBuilder(
              animation: controller.fadeAnimation,
              builder: (context, child) => Opacity(
                opacity: controller.fadeAnimation.value,
                child: child ?? const SizedBox(),
              ),
              child: AnimatedBuilder(
                animation: controller.rotateAnimation,
                builder: (context, child) => Transform.rotate(
                  angle: controller.rotateAnimation.value,
                  child: child ?? const SizedBox(),
                ),
                child: SvgPicture.asset(
                  'assets/svg/background_image.svg',
                  color: Theme.of(context).primaryColor,
                  fit: BoxFit.fitHeight,
                  height: widget.backgroundParameter.height,
                  placeholderBuilder: (context) => const SizedBox(),
                ),
              ),
            )),
      );

  Widget body(BuildContext context) => Theme(
        data: Theme.of(context)
            .copyWith(scaffoldBackgroundColor: Colors.transparent),
        child: PageView(
          controller: widget.controller.pageController,
          onPageChanged: (value) =>
              widget.controller.resourcesPage.value = value == 1 ? true : false,
          children: widget.children,
        ),
      );
}
