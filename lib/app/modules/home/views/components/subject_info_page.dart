// import 'dart:ui';
// import 'dart:math';
// import 'package:day_night_time_picker/lib/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/route_manager.dart';
// import 'package:class_link/app/gen/assets.gen.dart';
// import 'package:class_link/app/models/time_table/time_table.dart';

// class SubjectInfo extends StatelessWidget {
//   final Subject subject;

//   const SubjectInfo({
//     Key? key,
//     required this.subject,
//   }) : super(key: key);

//   MediaQueryData get mqData => MediaQueryData.fromWindow(window);

//   Color? getColor(bool isDay, bool isDusk) {
//     if (!isDay) {
//       return Colors.blueGrey[900];
//     }
//     if (isDusk) {
//       return Colors.orange[400];
//     }
//     return Colors.blue[200];
//   }

//   bool get isDay => subject.startTime.hour >= 6 && subject.startTime.hour <= 18;
//   bool get isDusk =>
//       subject.startTime.hour >= 16 && subject.startTime.hour <= 18;

//   @override
//   Widget build(BuildContext context) => Scaffold(
//           body: CustomScrollView(
//         physics: const BouncingScrollPhysics(),
//         slivers: [
//           sliverAppBar(context),
//           body(context),
//         ],
//       ));

//   SliverFillRemaining body(BuildContext context) => SliverFillRemaining(
//         fillOverscroll: true,
//         hasScrollBody: false,
//         child: Theme(
//           data: Get.theme.copyWith(
//             cardColor: Color.alphaBlend(
//                 Get.theme.colorScheme.primary
//                     .withAlpha(5 * (Get.isDarkMode ? 4 : 3)),
//                 Get.theme.cardColor),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Stack(
//               children: [
//                 SizedBox(
//                   height: mqData.size.height -
//                       (AppBar().preferredSize.height +
//                           mqData.padding.top +
//                           mqData.padding.bottom),
//                 ),
//                 Column(
//                   children: [
//                     Card(
//                       child: ListTile(
//                         leading: SvgPicture.asset(
//                           Assets.icons.meet.path,
//                           semanticsLabel: 'A red up arrow',
//                           height: 25,
//                           width: 25,
//                         ),
//                         title: Text(
//                           subject.googleClassRoomLink,
//                           overflow: TextOverflow.ellipsis,
//                           maxLines: 2,
//                         ),
//                         subtitle: const Text("Last modified by"),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );

//   Widget sliverAppBar(BuildContext context) => SliverAppBar(
//       expandedHeight: 200,
//       pinned: true,
//       snap: true,
//       floating: true,
//       leading: IconButton(
//         onPressed: () => Navigator.pop(context),
//         icon: const FaIcon(FontAwesomeIcons.arrowLeft),
//       ),
//       flexibleSpace: FlexibleSpaceBar(
//         background: AnimatedContainer(
//             duration: const Duration(seconds: 1),
//             color: getColor(isDay, isDusk),
//             height: 150,
//             width: Get.width,
//             child: LayoutBuilder(builder: (context, constraints) {
//               final maxWidht = constraints.maxWidth.round() - 100;
//               final displace = mapRange(subject.startTime.hour * 1.0, 0, 23);
//               final top = sin(pi * displace) * 1.8;
//               final left = maxWidht * displace;
//               return Stack(
//                 alignment: Alignment.center,
//                 children: <Widget>[
//                   Positioned(
//                     bottom: top * 20,
//                     left: left,
//                     child: SizedBox(
//                       width: 100,
//                       child: AnimatedSwitcher(
//                         switchInCurve: Curves.ease,
//                         switchOutCurve: Curves.ease,
//                         duration: const Duration(milliseconds: 250),
//                         child: isDay
//                             ? Container(
//                                 key: const ValueKey(1),
//                                 child: const Image(
//                                   image: AssetImage(
//                                     "packages/day_night_time_picker/assets/sun.png",
//                                   ),
//                                 ))
//                             : Container(
//                                 key: const ValueKey(2),
//                                 child: const Image(
//                                   image: AssetImage(
//                                       "packages/day_night_time_picker/assets/moon.png"),
//                                 ),
//                               ),
//                         transitionBuilder: (child, anim) {
//                           return ScaleTransition(
//                             scale: anim,
//                             child: FadeTransition(
//                               opacity: anim,
//                               child: SlideTransition(
//                                 position: anim.drive(
//                                   Tween(
//                                     begin: const Offset(0, 4),
//                                     end: const Offset(0, 0),
//                                   ),
//                                 ),
//                                 child: child,
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   )
//                 ],
//               );
//             })),
//         title: Hero(
//           tag: "subject_name",
//           child: Text(
//             subject.subjectName,
//             style: Theme.of(context).textTheme.headline4,
//           ),
//         ),
//       ));
// }
