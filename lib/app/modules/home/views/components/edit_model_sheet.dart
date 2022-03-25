import 'dart:ui';
import '../../controllers/venue_validator.dart';

import '../../../../global/widget/meet_link_selector.dart';
import '../../../../global/widget/time_selector.dart';
import '../../../../models/time_table/time_table.dart';
import '../../../../services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

enum ChangesType { roomNo, remark, gClassRoomLink, zoomLink, subjectAddedBy }

class DeviceSpec {
  static double topPadding(BuildContext context) =>
      MediaQueryData.fromWindow(window).padding.top;

  static double bottomPadding(BuildContext context) =>
      MediaQueryData.fromWindow(window).padding.bottom;

  static Size size(BuildContext context) =>
      MediaQueryData.fromWindow(window).size;

  static MediaQueryData mediaQueryData(BuildContext context) =>
      MediaQueryData.fromWindow(window);
}

class EditBottomSheet {
  final _subjectNameController = TextEditingController();
  final _roomNoController = TextEditingController();
  final _remarkController = TextEditingController();
  final _dayTimeController = TimeFieldController();
  final _gMeetLinkController = MeetLinkController();
  final _zMeetLinkController = MeetLinkController();
  final open = RxBool(false);
  final sheetController = SheetController();
  final formGlobalKey = GlobalKey<FormState>();
  final user = Get.find<AuthService>().user!;

  Future<Subject?> show(BuildContext context, Subject? subject) async {
    if (subject != null) {
      _subjectNameController.text = subject.subjectName;
      _remarkController.text = subject.remark;
      _roomNoController.text = subject.roomNo?.toString() ?? "";
      _gMeetLinkController.text = subject.googleClassRoomLink;
      _zMeetLinkController.text = subject.zoomLink;
      _dayTimeController.setTime(
          context,
          TimeOfDay(
              minute: subject.startTime.minute, hour: subject.startTime.hour));
    }
    return await showSlidingBottomSheet<Subject>(
      context,
      builder: (context) => SlidingSheetDialog(
          controller: sheetController,
          duration: const Duration(milliseconds: 400),
          cornerRadius: 20,
          snapSpec: const SnapSpec(
            snap: true,
            snappings: [1.0],
            positioning: SnapPositioning.relativeToAvailableSpace,
          ),
          headerBuilder: slidingSheetDialogHeaderBuilder,
          builder: slidingSheetDialogBuilder,
          footerBuilder: (context, state) =>
              slidingSheetDialogFooterBuilder(context, state, subject)),
    );
  }

  Widget slidingSheetDialogBuilder(BuildContext context, SheetState state) {
    if (state.extent == 1) if (!open.value) open.value = true;
    return Material(
      child: content(context, state),
    );
  }

  Widget slidingSheetDialogFooterBuilder(
          BuildContext context, SheetState state, Subject? subject) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.maxFinite,
          height: 40,
          child: ElevatedButton(
            onPressed: () => submit(context, subject),
            child: const Text("done"),
          ),
        ),
      );

  Widget slidingSheetDialogHeaderBuilder(
          BuildContext context, SheetState state) =>
      Material(
        child: Obx(() => SizedBox(
              width: double.infinity,
              child: open.value
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: DeviceSpec.topPadding(context)),
                        SizedBox(
                          height: 30,
                          child: Text("Edit Subject",
                              style: Theme.of(context).textTheme.headline6),
                        ),
                      ],
                    )
                  : SizedBox(
                      height: 30,
                      child: Center(
                        child: IconButton(
                            onPressed: () {
                              open.value = true;
                              sheetController.expand();
                            },
                            icon: const Icon(Icons.keyboard_arrow_up_rounded)),
                      ),
                    ),
            )),
      );

  Widget content(BuildContext context, SheetState state) => Stack(
        children: [
          Obx(
            () => Container(
              height: open.value
                  ? DeviceSpec.size(context).height -
                      (DeviceSpec.topPadding(context) +
                          DeviceSpec.bottomPadding(context) +
                          (16 + 40 + 30))
                  : 0,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                key: formGlobalKey,
                child: ListView(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                    left: 10,
                    right: 10,
                  ),
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    TextFormField(
                      controller: _subjectNameController,
                      decoration: InputDecoration(
                        border: curvedBox(),
                        filled: true,
                        hintText: "Subject",
                      ),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Subject name is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _remarkController,
                      maxLines: null,
                      maxLength: 250,
                      minLines: 3,
                      decoration: InputDecoration(
                        border: curvedBox(),
                        filled: true,
                        hintText: "Remark",
                      ),
                      textInputAction: TextInputAction.done,
                      // validator: ,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _roomNoController,
                      maxLines: 1,
                      textCapitalization: TextCapitalization.characters,
                      decoration: InputDecoration(
                        border: curvedBox(),
                        filled: true,
                        hintText: "Venue",
                      ),
                      textInputAction: TextInputAction.done,
                      validator: VenueValidator.validate,
                    ),
                    const SizedBox(height: 10),
                    MeetLinkSelector(
                      meetType: MeetLinkType.googleClassroom,
                      controller: _gMeetLinkController,
                    ),
                    const SizedBox(height: 10),
                    MeetLinkSelector(
                      meetType: MeetLinkType.zoomLink,
                      controller: _zMeetLinkController,
                    ),
                    const SizedBox(height: 10),
                    SelectTimeFIeld(
                      dayTimeController: _dayTimeController,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );

  static OutlineInputBorder curvedBox() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      );

  void submit(BuildContext context, Subject? subject) {
    final Subject? sub = Subject(
      subjectName: _subjectNameController.text,
      subjectAddBy: subject == null
          ? addByInfo(subject, ChangesType.subjectAddedBy)
          : subject.subjectAddBy,
      roomNo: _roomNoController.text,
      roomNoAddBy: addByInfo(subject, ChangesType.roomNo),
      remark: _remarkController.text,
      remarkAddBy: addByInfo(subject, ChangesType.remark),
      googleClassRoomLink: _gMeetLinkController.text,
      gLinkAddBy: addByInfo(subject, ChangesType.gClassRoomLink),
      zoomLink: _zMeetLinkController.text,
      zLinkAddBy: addByInfo(subject, ChangesType.zoomLink),
      startTime: DayTime(
        hour: _dayTimeController.dayTime?.hour ?? 0,
        minute: _dayTimeController.dayTime?.minute ?? 0,
      ),
    );
    if (formGlobalKey.currentState!.validate()) Navigator.pop(context, sub);
  }

  String get addedByInfo => "${user.displayName},${user.email}";

  String addByInfo(Subject? subject, [ChangesType? change]) {
    if (subject != null) {
      if (change == ChangesType.remark) {
        return subject.remark == _remarkController.text
            ? subject.remarkAddBy
            : addedByInfo;
      } else if (change == ChangesType.roomNo) {
        return subject.roomNo == _roomNoController.text
            ? subject.roomNoAddBy
            : addedByInfo;
      } else if (change == ChangesType.gClassRoomLink) {
        return subject.googleClassRoomLink == _gMeetLinkController.text
            ? subject.gLinkAddBy
            : addedByInfo;
      } else if (change == ChangesType.zoomLink) {
        return subject.zoomLink == _zMeetLinkController.text
            ? subject.zLinkAddBy
            : addedByInfo;
      } else if (change == ChangesType.subjectAddedBy) {
        return subject.subjectAddBy;
      } else {
        throw "Unknown change";
      }
    } else if (change == ChangesType.subjectAddedBy) {
      return addedByInfo;
    }
    return "";
  }

  void dispose() {
    open.close();
  }
}
