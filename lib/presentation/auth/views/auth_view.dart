import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../global/gen/assets.gen.dart';
import '../../../../global/widget/app_title.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        // body: PageView(
        //   controller: controller.pageController,
        //   onPageChanged: (value) => controller.currentPage.value = value,
        //   children: [
        //     firstPage(context),
        //     secondPage(context),
        //   ],
        // ),
        body: firstPage(context),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // pageIndicator(context),
                // const SizedBox(height: 50),
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
                        // SvgPicture.asset(
                        //   Assets.icons.google.path,
                        //   semanticsLabel: 'A red up arrow',
                        //   height: 20,
                        //   width: 20,
                        // ),
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

  // Widget secondPage(BuildContext context) => Stack(
  //       children: [
  //         Positioned(
  //           bottom: 0,
  //           left: 0,
  //           right: 0,
  //           child: Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 20),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 AnimatedSize(
  //                   duration: const Duration(milliseconds: 200),
  //                   curve: Curves.easeInOut,
  //                   child: Get.isDarkMode
  //                       ? Obx(
  //                           () => SwitchListTile(
  //                             contentPadding:
  //                                 const EdgeInsets.symmetric(horizontal: 4),
  //                             shape: RoundedRectangleBorder(
  //                               borderRadius: BorderRadius.circular(0),
  //                             ),
  //                             title: Text('Black Mode',
  //                                 style: Theme.of(context).textTheme.headline3),
  //                             onChanged: controller.blackModeOnChange,
  //                             value: controller.isBlack,
  //                           ),
  //                         )
  //                       : SizedBox(
  //                           width: MediaQuery.of(context).size.width,
  //                         ),
  //                 ),
  //                 const SizedBox(height: 20),
  //                 Theme(
  //                   data: Theme.of(context),
  //                   child: ListTile(
  //                       shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(10),
  //                       ),
  //                       contentPadding:
  //                           const EdgeInsets.only(left: 5, right: 10),
  //                       trailing: Column(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Get.theme.brightness == Brightness.dark
  //                               ? const FaIcon(
  //                                   FontAwesomeIcons.moon,
  //                                   size: 40,
  //                                 )
  //                               : const FaIcon(
  //                                   FontAwesomeIcons.sun,
  //                                   size: 40,
  //                                 ),
  //                         ],
  //                       ),
  //                       title: Text("Theme Mode",
  //                           style: Theme.of(context).textTheme.headline3),
  //                       subtitle: Text(
  //                         Get.isDarkMode ? " Dark Mode" : " Light Mode",
  //                         style: const TextStyle(fontSize: 18),
  //                       ),
  //                       onTap: () => controller.toggleThemeMode()),
  //                 ),
  //                 const SizedBox(height: 20),
  //                 Padding(
  //                   padding: const EdgeInsets.symmetric(horizontal: 5),
  //                   child: Text(
  //                     "Select theme",
  //                     style: Theme.of(context).textTheme.headline3,
  //                   ),
  //                 ),
  //                 Theme(
  //                   data: Theme.of(context),
  //                   child: const Padding(
  //                     padding: EdgeInsets.symmetric(vertical: 8),
  //                     child: ThemeSelector(),
  //                   ),
  //                 ),
  //                 const SizedBox(),
  //               ],
  //             ),
  //           ),
  //         ),
  //         Center(
  //           child: SvgPicture.asset(
  //             "assets/svg/intro.svg",
  //             color: Theme.of(context).primaryColor.withOpacity(.2),
  //           ),
  //         ),
  //       ],
  //     );

  // Widget pageIndicator(BuildContext context) => Obx(
  //       () => Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: List.generate(
  //             2,
  //             (index) => Container(
  //                   margin: const EdgeInsets.symmetric(horizontal: 5),
  //                   decoration: controller.currentPage.value == index
  //                       ? BoxDecoration(
  //                           color: Theme.of(context).primaryColor,
  //                           borderRadius: BorderRadius.circular(5),
  //                         )
  //                       : BoxDecoration(
  //                           color: Colors.grey[800],
  //                           borderRadius: BorderRadius.circular(5),
  //                         ),
  //                   height: 10,
  //                   width: 10,
  //                 )),
  //       ),
  //     );

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
            padding: const EdgeInsets.all(40.0),
            child: Text(
              'View the current class with just one click. Get notes, PYQs, holidays list and more.',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(fontSize: 20),
            ),
          ),
        ],
      );
}
