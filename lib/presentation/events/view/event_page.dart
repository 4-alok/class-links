import 'package:class_link/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:timelines/timelines.dart';

import '../controller/event_controller.dart';
import 'components/content_tile.dart';

class EventPage extends GetView<EventsController> {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(),
        body: Obx(
          () => controller.loading.value
              ? const LinearProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: eventTimeline(context),
                ),
        ),
        floatingActionButton: controller.canSendEvent
            ? FloatingActionButton.extended(
                onPressed: () => Get.toNamed(Routes.CREATE_EVENT),
                icon: const FaIcon(FontAwesomeIcons.paperPlane),
                label: const Text("Add Event"),
              )
            : const SizedBox(),
      );

  Widget eventTimeline(BuildContext context) => Timeline.tileBuilder(
        theme: TimelineThemeData(
          nodePosition: 0,
          indicatorPosition: .05,
          connectorTheme: ConnectorThemeData(
              thickness: 5.0,
              color: Theme.of(context).primaryColor.withAlpha(50)),
          indicatorTheme: IndicatorThemeData(
              size: 15.0, color: Theme.of(context).colorScheme.secondary),
        ),
        physics: const BouncingScrollPhysics(),
        builder: TimelineTileBuilder.connected(
          contentsAlign: ContentsAlign.basic,
          itemCount: controller.events.length,
          connectorBuilder: (context, index, type) => index < 3 - 1
              ? SolidLineConnector(
                  color: Theme.of(context).secondaryHeaderColor)
              : const SolidLineConnector(),
          indicatorBuilder: (context, index) => index < 3
              ? DotIndicator(
                  size: 20,
                  color: Theme.of(context).primaryColor,
                  child: Icon(Icons.check,
                      size: 14.0,
                      color: Theme.of(context).colorScheme.onPrimary))
              : OutlinedDotIndicator(
                  size: 20, color: Theme.of(context).primaryColor),
          contentsBuilder: (context, index) =>
              ContentTile(event: controller.events[index]),
        ),
      );

  AppBar appBar() => AppBar(
        centerTitle: true,
        leading: Hero(
          tag: "back",
          child: Material(
              child: IconButton(
            icon: const FaIcon(FontAwesomeIcons.arrowLeft),
            onPressed: () => Get.back(),
          )),
        ),
        title: const Text('Events'),
      );
}
