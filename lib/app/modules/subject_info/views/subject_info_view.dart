import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/subject_info/subject_info.dart';
import '../controllers/subject_info_controller.dart';
import 'components/appbar.dart';
import 'components/body.dart';

class SubjectInfoView extends GetView<SubjectInfoController> {
  const SubjectInfoView({
    Key? key,
    this.subjectInfo,
  }) : super(key: key);

  final SubjectInfo? subjectInfo;

  MediaQueryData get mqData => MediaQueryData.fromWindow(window);

  @override
  Widget build(BuildContext context) {
    controller.subjectInfo = subjectInfo;
    return Scaffold(
        body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SubjectInfoAppBar(controller: controller),
        body(context),
      ],
    ));
  }

  // SliverPersistentHeader get sliverPersistenHeader => SliverPersistentHeader(
  //       pinned: true,
  //       floating: true,
  //       delegate: CustomSliverDelegate(
  //         expandedHeight: 320,
  //       ),
  //     );

  SliverFillRemaining body(BuildContext context) => SliverFillRemaining(
        fillOverscroll: true,
        hasScrollBody: false,
        child: Theme(
          data: Get.theme.copyWith(
            cardColor: Color.alphaBlend(
                Get.theme.colorScheme.primary
                    .withAlpha(5 * (Get.isDarkMode ? 4 : 3)),
                Get.theme.cardColor),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                SizedBox(
                  height: mqData.size.height -
                      (AppBar().preferredSize.height +
                          mqData.padding.top +
                          mqData.padding.bottom),
                ),
                Column(
                  children: [
                    const SizedBox(height: 10),
                    SubjectInfoBody(controller: controller).remark,
                    SubjectInfoBody(controller: controller).room,
                    const SizedBox(height: 10),
                    SubjectInfoBody(controller: controller).googleLink(context),
                    const SizedBox(height: 10),
                    SubjectInfoBody(controller: controller).zoomLink(context),
                    const SizedBox(height: 10),
                    SubjectInfoBody(controller: controller)
                        .scheduleButtons(context)
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  @override
  String? get tag => SubjectInfoController.TAG;
}

// class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
//   final double expandedHeight;
//   final bool hideTitleWhenExpanded;

//   CustomSliverDelegate({
//     required this.expandedHeight,
//     this.hideTitleWhenExpanded = true,
//   });

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     final appBarSize = expandedHeight - shrinkOffset;
//     final cardTopPosition = expandedHeight / 2 - shrinkOffset;
//     final proportion = 2 - (expandedHeight / appBarSize);
//     final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
//     return SizedBox(
//       height: expandedHeight + expandedHeight / 2,
//       child: Stack(
//         children: [
//           SizedBox(
//             height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
//             child: AppBar(
//               backgroundColor: Colors.green,
//               leading: IconButton(
//                 icon: const Icon(Icons.menu),
//                 onPressed: () {},
//               ),
//               elevation: 0.0,
//               title: Opacity(
//                   opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
//                   child: const Text("Test")),
//             ),
//           ),
//           Positioned(
//             left: 0.0,
//             right: 0.0,
//             top: cardTopPosition > 0 ? cardTopPosition : 0,
//             bottom: 0.0,
//             child: Opacity(
//               opacity: percent,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 30 * percent),
//                 child: const Card(
//                   elevation: 20.0,
//                   child: Center(
//                     child: Text("Header"),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   double get maxExtent => expandedHeight + expandedHeight / 2;

//   @override
//   double get minExtent => kToolbarHeight;

//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
//     return true;
//   }
// }
