part of '../views/components/parallex_page_view.dart';

class ParallexPageController {
  final double backgoundOpacity;
  ParallexPageController({required this.backgoundOpacity});

  late final AnimationController slideAnimationController;
  late final AnimationController introAnimationController;
  late final double shiftSize;

  late final Animation<double> fadeAnimation;
  // late final Animation<double> rotateAnimation;

  /// > We create a singleton instance of the ResourcesController, and then we create an
  /// AnimationController for the slide animation and the intro animation
  ///
  /// Args:
  ///   state (ParallexPageViewState): The state of the ParallexPageView widget.
  ///   pageController (PageController): The PageController that is used to control the pageview.
  void init(ParallexPageViewState state, PageController pageController) {
    /// A way to create a singleton instance of the ResourcesController.
    Get.put<ResourcesController>(ResourcesController());
    shiftSize = MediaQueryData.fromView(window).size.width /
        state.widget.children.length;

    /// Creating an AnimationController that will be used to control the slide animation.
    slideAnimationController = AnimationController(
        vsync: state, duration: const Duration(milliseconds: 600));

    /// Creating an AnimationController that will be used to control the intro animation.
    introAnimationController = AnimationController(
        vsync: state, duration: const Duration(milliseconds: 2000));

    /// Creating an animation that will be used to control the opacity of the background.
    fadeAnimation = Tween<double>(begin: 0.0, end: backgoundOpacity).animate(
        CurvedAnimation(
            parent: introAnimationController, curve: Curves.easeInOutSine));

    // rotateAnimation = Tween<double>(begin: .3, end: 0).animate(CurvedAnimation(
    //     parent: introAnimationController, curve: Curves.easeInOutSine));

    /// Updating the value of the slideAnimationController based on the pageController.
    pageController.addListener(() => slideAnimationController.value =
        (pageController.page ?? 0.0) / state.widget.children.length);

    /// Starting the animation.
    introAnimationController.forward();
  }

  /// `dispose()` is called when the widget is removed from the widget tree
  void dispose() {
    /// Deleting the singleton instance of the ResourcesController.
    Get.delete<ResourcesController>();

    /// Disposing the animation controllers.
    slideAnimationController.dispose();
    introAnimationController.dispose();
  }
}
