import 'package:animations/animations.dart';
import 'package:class_link/app/gen/assets.gen.dart';
import 'package:class_link/app/models/time_table/time_table.dart';
import 'package:class_link/app/modules/home/views/components/subject_info_page.dart';
import 'package:class_link/app/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vibration/vibration.dart';

class CurrentClassCard extends StatelessWidget {
  final Subject item;
  const CurrentClassCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: OpenContainer(
        closedElevation: 5,
        closedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        closedColor: Theme.of(context).scaffoldBackgroundColor,
        openColor: Theme.of(context).scaffoldBackgroundColor,
        middleColor: Theme.of(context).scaffoldBackgroundColor,
        closedBuilder: (context, action) => InkWell(
          onLongPress: () => _onLongPress(action),
          onTap: () => onTap(context, action, item),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 8),
                Row(children: [
                  Container(
                    height: 23,
                    width: 4,
                    color: Theme.of(context).colorScheme.secondaryVariant,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    item.startTime.text12HourStartEnd,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Get.theme.primaryColor),
                  ),
                ]),
                const SizedBox(height: 8),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item.subjectName,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    trailingWidget(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Text(
                    item.remark == "" ? "No Remark" : item.remark,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
        openBuilder: (context, action) => SubjectInfo(subject: item),
      ),
    );
  }

  Future<void> _onLongPress(void Function() action) async {
    if ((await Vibration.hasVibrator()) ?? false) {
      Vibration.vibrate();
      if ((await Vibration.hasAmplitudeControl()) ?? false) {
        Vibration.vibrate(
          duration: 20,
          amplitude: 200,
        );
      }
    }
    action();
  }

  void onTap(BuildContext context, Function action, Subject item) {
    if (item.zoomLink == "" && item.googleClassRoomLink == "") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        duration: Duration(seconds: 1),
        content: Text("No Link Available"),
      ));
    } else if (item.zoomLink != "" && item.googleClassRoomLink != "") {
    } else if (item.zoomLink == "" && item.googleClassRoomLink != "") {
      launchUrl(context, item.googleClassRoomLink);
    } else if (item.zoomLink != "" && item.googleClassRoomLink == "") {
      launchUrl(context, item.zoomLink);
    }
  }

  Future<void> launchUrl(BuildContext context, String url) async {
    try {
      await launch(url);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Unable to open"),
      ));
    }
  }

  Widget trailingWidget() => item.roomNo != null
      ? Text(
          item.roomNo.toString(),
          style: const TextStyle(
            fontSize: 12,
            color: Colors.red,
          ),
        )
      : Wrap(
          children: [
            item.googleClassRoomLink == ""
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.only(right: 8, top: 3),
                    child: SvgPicture.asset(
                      Assets.icons.meet.path,
                      semanticsLabel: 'A red up arrow',
                      height: 25,
                      width: 25,
                    ),
                  ),
            item.zoomLink == ""
                ? const SizedBox()
                : SvgPicture.asset(
                    Assets.icons.zoom.path,
                    semanticsLabel: 'A red up arrow',
                    height: 30,
                    width: 30,
                  ),
          ],
        );
}