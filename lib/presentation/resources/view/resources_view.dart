import 'dart:io';

import 'package:class_link/global/widget/launcher.dart';
import 'package:class_link/presentation/home/views/components/ads_contrainer.dart';
import 'package:class_link/presentation/resources/controler/resources_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../global/models/resources/resources_entities.dart';
import 'document_web_view.dart';

class ResourcesView extends GetView<ResourcesController> {
  const ResourcesView({Key? key}) : super(key: key);

  void onFileClick(BuildContext context, IndexFile file) {
    if (file.path.endsWith(".mp4")) {
      Launcher.launchUrl(context, file.id);
    } else {
      (Platform.isAndroid)
          ? Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DocumentWebView(url: file.id)),
            )
          : ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Only available on Android')),
            );
    }
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async => controller.backButtonController,
        child: Scaffold(
          appBar: appBar(context),
          body: ValueListenableBuilder<bool>(
            valueListenable: controller.hasData,
            builder: (context, value, child) => value
                ? bodyBuilder(context)
                : const Center(child: CircularProgressIndicator()),
          ),
          bottomNavigationBar: const AdsContainer(),
        ),
      );

  Widget bodyBuilder(BuildContext context) => ValueListenableBuilder<String>(
      valueListenable: controller.currentPath,
      builder: (context, value, child) => FutureBuilder<List<IndexEntity>>(
          future: controller.getList(value),
          builder: (context, snapshot) {
            final list = controller.currentEntity.value;
            if (list.isEmpty) {
              return const Center(child: Text('No files found'));
            }
            return AnimationLimiter(
              key: UniqueKey(),
              child: Scrollbar(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: list.length,
                  itemBuilder: (context, index) =>
                      AnimationConfiguration.staggeredList(
                    duration: const Duration(milliseconds: 300),
                    position: index,
                    child: SlideAnimation(
                      child: FadeInAnimation(
                        child: Card(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(.1),
                          child: ListTile(
                            onTap: () => (list[index] is IndexFolder)
                                ? controller.currentPath.value =
                                    "${list[index].path}/"
                                : onFileClick(
                                    context, list[index] as IndexFile),
                            leading: leadingIcon(
                              isfolder: list[index] is IndexFolder,
                              fileName: list[index].name,
                            ),
                            title: Text(list[index].name),
                            trailing: list[index] is IndexFolder
                                ? null
                                : Text(controller.kiloBytesToString(
                                    (list[index] as IndexFile).size)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }));

  Widget leadingIcon({required bool isfolder, String fileName = ''}) {
    if (isfolder) {
      return const FaIcon(FontAwesomeIcons.solidFolder);
    } else {
      if (fileName.endsWith('.pdf')) {
        return const FaIcon(FontAwesomeIcons.solidFilePdf);
      } else if (fileName.endsWith('.pptx') || fileName.endsWith('.ppt')) {
        return const FaIcon(FontAwesomeIcons.solidFilePowerpoint);
      } else if (fileName.endsWith('.docx') || fileName.endsWith('.doc')) {
        return const FaIcon(FontAwesomeIcons.solidFileWord);
      }
      return const FaIcon(FontAwesomeIcons.solidFile);
    }
  }

  AppBar appBar(BuildContext context) => AppBar(
        leading: IconButton(
          onPressed: () => (controller.backButtonController)
              ? Navigator.canPop(context)
                  ? Navigator.pop(context)
                  : null
              : null,
          icon: const FaIcon(FontAwesomeIcons.arrowLeft),
        ),
        title: const Text('Resources'),
      );
}
