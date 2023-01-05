part of '../views/components/parallex_page_view.dart';

class ParallexPageController {
  late final AnimationController slideAnimationController;
  late final AnimationController introAnimationController;
  late final double shiftSize;

  late final Animation<double> fadeAnimation;
  late final Animation<double> rotateAnimation;

  void init(ParallexPageViewState state, PageController pageController) {
    Get.put<ResourcesController>(ResourcesController());
    shiftSize = MediaQueryData.fromWindow(window).size.width /
        state.widget.children.length;
    slideAnimationController = AnimationController(
        vsync: state, duration: const Duration(milliseconds: 0));

    introAnimationController = AnimationController(
        vsync: state, duration: const Duration(milliseconds: 1500));

    fadeAnimation = Tween<double>(begin: 0.0, end: .1).animate(CurvedAnimation(
        parent: introAnimationController, curve: Curves.easeInOutSine));

    rotateAnimation = Tween<double>(begin: .3, end: 0).animate(CurvedAnimation(
        parent: introAnimationController, curve: Curves.easeInOutSine));

    pageController.addListener(() {
      slideAnimationController.value =
          (pageController.page ?? 0.0) / state.widget.children.length;
    });

    introAnimationController.forward();
  }

  void dispose() {
    Get.delete<ResourcesController>();
    slideAnimationController.dispose();
    introAnimationController.dispose();
  }
}
