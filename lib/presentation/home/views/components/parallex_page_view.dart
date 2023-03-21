import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../resources/controller/resources_controller.dart';
import '../../controllers/home_controller.dart';
import '../../model/background_parameter.dart';

part '../../controllers/parallex_page_controller.dart';

class ParallexPageView extends StatefulWidget {
  final List<Widget> children;
  final Parameter backgroundParameter;
  final HomeController controller;
  final double backgoundOpacity;
  const ParallexPageView(
      {Key? key,
      required this.children,
      required this.backgroundParameter,
      required this.controller,
      this.backgoundOpacity = .1})
      : super(key: key);

  @override
  State<ParallexPageView> createState() => ParallexPageViewState();
}

class ParallexPageViewState extends State<ParallexPageView>
    with TickerProviderStateMixin {
  late ParallexPageController controller;

  @override
  void initState() {
    controller =
        ParallexPageController(backgoundOpacity: widget.backgoundOpacity);
    controller.init(this, widget.controller.pageController);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Size size(BuildContext context) => MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          background(context),
          svgAnimation(context),
          body(context),
        ],
      );

  Widget background(BuildContext context) => SizedBox(
        height: size(context).height,
        width: size(context).width,
        child: ColoredBox(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      );

  Widget svgAnimation(BuildContext context) => Positioned(
        bottom: 0,
        left: 0,
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
              child: SvgPicture.asset(
                'assets/svg/background_image.svg',
                color: Theme.of(context).primaryColor,
                fit: BoxFit.fitHeight,
                width: size(context).width + (size(context).width / 2),
                placeholderBuilder: (context) => const SizedBox(),
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
