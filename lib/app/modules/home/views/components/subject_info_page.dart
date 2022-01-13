import 'dart:ui';
import 'package:class_link/app/gen/assets.gen.dart';
import 'package:class_link/app/models/time_table/time_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';

class SubjectInfo extends StatelessWidget {
  final Subject subject;

  const SubjectInfo({
    Key? key,
    required this.subject,
  }) : super(key: key);

  MediaQueryData get mqData => MediaQueryData.fromWindow(window);

  @override
  Widget build(BuildContext context) => Scaffold(
          body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          sliverAppBar(context),
          body(context),
        ],
      ));

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
                    Card(
                      child: ListTile(
                        leading: SvgPicture.asset(
                          Assets.icons.meet.path,
                          semanticsLabel: 'A red up arrow',
                          height: 25,
                          width: 25,
                        ),
                        title: Text(
                          subject.googleClassRoomLink,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        subtitle: const Text("Last modified by"),
                        // trailing: IconButton(
                        //   onPressed: () {},
                        //   icon: const FaIcon(FontAwesomeIcons.pen),
                        // ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Widget sliverAppBar(BuildContext context) => SliverAppBar(
      expandedHeight: 200,
      pinned: true,
      snap: true,
      floating: true,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const FaIcon(FontAwesomeIcons.arrowLeft),
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Hero(
          tag: "subject_name",
          child: Text(
            subject.subjectName,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ));
}
