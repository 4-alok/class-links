import '../../../gen/assets.gen.dart';
import '../../../global/widget/app_title.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:class_link/app/modules/user_info/controllers/user_info_controller.dart';
// import 'package:class_link/app/modules/user_info/views/user_info_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: const Center(
            child: Hero(
          tag: "app_logo",
          flightShuttleBuilder: AppTitleWidget.flightShuttleBuilder,
          transitionOnUserGestures: true,
          child: Material(
            type: MaterialType.transparency,
            child: AppTitleWidget(fontSize: 60),
          ),
        )),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    "by GDSC TEAM KIIT",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontSize: 12),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: controller.loading.value
                      ? null
                      : () => controller.login(),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          Assets.icons.google.path,
                          semanticsLabel: 'A red up arrow',
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
              ],
            ),
          ),
        ),
      );
}
