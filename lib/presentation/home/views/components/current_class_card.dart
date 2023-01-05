import 'package:animations/animations.dart';
import 'package:class_link/global/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vibration/vibration.dart';

import '../../../../../global/gen/assets.gen.dart';
import '../../../../global/models/subject_info/subject_info.dart';
import '../../../../global/models/time_table/time_table.dart';
import '../../../subject_info/controllers/subject_info_controller.dart';
import '../../../subject_info/views/subject_info_view.dart';

class CurrentClassCard extends StatelessWidget {
  final SubjectInfo subjectInfo;
  final bool elective;
  const CurrentClassCard(
      {Key? key, required this.subjectInfo, this.elective = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        child: OpenContainer(
          closedElevation: 5,
          closedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          closedColor: Theme.of(context).scaffoldBackgroundColor,
          openColor: Theme.of(context).scaffoldBackgroundColor,
          middleColor: Theme.of(context).scaffoldBackgroundColor,
          closedBuilder: (context, action) => closeTile(action, context),
          openBuilder: (context, action) {
            Get.lazyPut<SubjectInfoController>(() => SubjectInfoController(),
                tag: SubjectInfoController.TAG);
            return SubjectInfoView(subjectInfo: subjectInfo);
          },
        ),
      );

  Widget closeTile(VoidCallback action, BuildContext context) => Container(
        color: Theme.of(context).colorScheme.secondaryContainer.withOpacity(.2),
        child: InkWell(
          onLongPress: () => _onLongPress(action),
          onTap: () => onTap(context, action, subjectInfo.subject),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 10),
                      color: Theme.of(context)
                          .colorScheme
                          .secondaryContainer
                          .withOpacity(.1),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 23,
                            width: 4,
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            subjectInfo.subject.startTime.startEndTimeRange,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: Get.theme.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    elective
                        ? Text(
                            "Elective Subject",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          subjectInfo.subject.subjectName,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      trailingWidget,
                    ]),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Text(
                    subjectInfo.subject.remark == ""
                        ? "No Remark"
                        : subjectInfo.subject.remark,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      );

  Future<void> _onLongPress(void Function() action) async {
    if ((await Vibration.hasVibrator()) ?? false) {
      Vibration.vibrate();
      if ((await Vibration.hasAmplitudeControl()) ?? false) {
        Vibration.vibrate(duration: 20, amplitude: 200);
      }
    }
    action();
  }

  void onTap(BuildContext context, Function action, Subject subjectInfo) {
    if (subjectInfo.zoomLink == "" && subjectInfo.googleClassRoomLink == "") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        duration: Duration(seconds: 1),
        content: Text("No Link Available"),
      ));
    } else if (subjectInfo.zoomLink != "" &&
        subjectInfo.googleClassRoomLink != "") {
      showClassDialog(context);
    } else if (subjectInfo.zoomLink == "" &&
        subjectInfo.googleClassRoomLink != "") {
      launch(context, subjectInfo.googleClassRoomLink);
    } else if (subjectInfo.zoomLink != "" &&
        subjectInfo.googleClassRoomLink == "") {
      launch(context, subjectInfo.zoomLink);
    }
  }

  Future<void> launch(BuildContext context, String url) async {
    try {
      await launchUrl(Uri(path: url));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Unable to open"),
      ));
    }
  }

  Future<void> showClassDialog(BuildContext context) async => await showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("Choose Url"),
          content: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () =>
                      launch(context, subjectInfo.subject.googleClassRoomLink),
                  child: SvgPicture.asset(
                    Assets.icons.meet.path,
                    semanticsLabel: 'Google Class Room',
                    height: 35,
                    width: 35,
                  ),
                ),
                const SizedBox(width: 80),
                GestureDetector(
                  onTap: () => launch(context, subjectInfo.subject.zoomLink),
                  child: SvgPicture.asset(
                    Assets.icons.zoom.path,
                    semanticsLabel: 'Zoom Meet',
                    height: 50,
                    width: 50,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
                child: const Text("Cancel"),
                onPressed: () => Navigator.pop(context))
          ],
        ),
      );

  Widget get trailingWidget => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              subjectInfo.subject.googleClassRoomLink == ""
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
              subjectInfo.subject.zoomLink == ""
                  ? const SizedBox()
                  : SvgPicture.asset(
                      Assets.icons.zoom.path,
                      semanticsLabel: 'A red up arrow',
                      height: 30,
                      width: 30,
                    ),
              (subjectInfo.subject.googleClassRoomLink == "") &&
                      (subjectInfo.subject.zoomLink == "")
                  ? const SizedBox()
                  : Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      height: 20,
                      width: 2,
                      color: Get.theme.colorScheme.secondaryContainer,
                    ),
              subjectInfo.subject.roomNo != null
                  ? Text(
                      subjectInfo.subject.roomNo.toString(),
                      style: Get.theme.textTheme.headline3!.copyWith(
                        color: Get.theme.colorScheme.primary,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ],
      );
}
