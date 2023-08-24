import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../global/gen/assets.gen.dart';
import '../../../../global/widget/app_title.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Theme.of(context).scaffoldBackgroundColor,
              statusBarIconBrightness:
                  Get.isDarkMode ? Brightness.light : Brightness.dark,
              systemNavigationBarColor:
                  Theme.of(context).scaffoldBackgroundColor,
            ),
            elevation: 0,
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              child: Get.isDarkMode
                  ? SvgPicture.asset("assets/svg/halftone.svg")
                  : SvgPicture.asset(
                      "assets/svg/halftone.svg",
                      color: Theme.of(context).primaryColor.withOpacity(0.05),
                    ),
            ),
            firstPage(context),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: loginButton(),
            ),
          ],
        ),
      );

  Widget loginButton() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: controller.loading.value
                    ? null
                    : () => controller.handleLogin(),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                    side: BorderSide(width: 2, color: Get.theme.primaryColor),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          Assets.icons.google.path,
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(width: 10),
                        const Text("Login"),
                        const SizedBox(width: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget firstPage(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          const Center(
              child: Hero(
            tag: "app_logo",
            flightShuttleBuilder: AppTitleWidget.flightShuttleBuilder,
            transitionOnUserGestures: true,
            child: Material(
              type: MaterialType.transparency,
              child: AppTitleWidget(fontSize: 60),
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'STREAMLINING ACADEMIC EXCELLENCE',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
            ),
          ),
        ],
      );
}
