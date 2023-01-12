import 'package:class_link/global/widget/launcher.dart';
import 'package:class_link/presentation/resources/controller/resources_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../global/models/resources/resources_entities.dart';
import '../../../global/widget/user_icon.dart';
import '../../../routes/app_pages.dart';
import '../../home/views/components/loading_database_icon.dart';

class ResourcesView extends GetView<ResourcesController> {
  const ResourcesView({Key? key}) : super(key: key);

  void openDox(BuildContext context, IndexFile file) =>
      Launcher.launchUrl(context, file.id);

  Future<void> prevDoc(BuildContext context, String url) async {
    try {
      await launch(
        url,
        customTabsOption: CustomTabsOption(
          toolbarColor: Theme.of(context).primaryColor,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
          extraCustomTabs: const <String>[
            // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
            'org.mozilla.firefox',
            // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
            'com.microsoft.emmx',
          ],
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
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
        ),
      );

  Widget bodyBuilder(BuildContext context) => ValueListenableBuilder<String>(
      valueListenable: controller.currentPath,
      builder: (context, value, child) {
        return FutureBuilder<List<IndexEntity>>(
            future: controller.getList(value),
            builder: (context, snapshot) {
              final list = controller.currentEntity.value;
              if (list.isEmpty) {
                return const Center(
                    child: Text('No files or directories found'));
              }
              return AnimationLimiter(
                key: UniqueKey(),
                child: Scrollbar(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    itemCount: list.length,
                    itemBuilder: (context, index) =>
                        AnimationConfiguration.staggeredList(
                      duration: const Duration(milliseconds: 300),
                      position: index,
                      child: SlideAnimation(
                        child: FadeInAnimation(
                          child: ListTile(
                            // tileColor: Colors.green,
                            onTap: () => (list[index] is IndexFolder)
                                ? controller.currentPath.value =
                                    "${list[index].path}/"
                                : openDox(context, list[index] as IndexFile),
                            onLongPress: () => (list[index] is IndexFile)
                                ? prevDoc(
                                    context, (list[index] as IndexFile).id)
                                : null,
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
              );
            });
      });

  Widget leadingIcon({required bool isfolder, String fileName = ''}) {
    if (isfolder) {
      return FaIcon(FontAwesomeIcons.folder, color: Get.theme.primaryColor);
    } else {
      if (fileName.toLowerCase().endsWith('.pdf')) {
        return FaIcon(FontAwesomeIcons.filePdf, color: Colors.red[400]);
      } else if (fileName.toLowerCase().endsWith('.pptx') ||
          fileName.toLowerCase().endsWith('.ppt')) {
        return FaIcon(FontAwesomeIcons.filePowerpoint,
            color: Colors.yellow[400]);
      } else if (fileName.toLowerCase().endsWith('.docx') ||
          fileName.toLowerCase().endsWith('.doc')) {
        return const FaIcon(FontAwesomeIcons.fileWord, color: Colors.blue);
      } else if (fileName.toLowerCase().endsWith('.xlsx') ||
          fileName.toLowerCase().endsWith(
                '.xls',
              )) {
        return const FaIcon(FontAwesomeIcons.fileExcel, color: Colors.green);
      } else if (fileName.toLowerCase().endsWith('.png') ||
          fileName.toLowerCase().endsWith('.jpg')) {
        return const FaIcon(FontAwesomeIcons.fileImage, color: Colors.purple);
      }
      return const FaIcon(FontAwesomeIcons.solidFile);
    }
  }

  AppBar appBar(BuildContext context) => AppBar(
        leading: LoadingDatabaseIcon(
          icon: ValueListenableBuilder<String>(
            valueListenable: controller.currentPath,
            builder: (_, __, ___) =>
                "/".allMatches(controller.currentPath.value).length > 1
                    ? IconButton(
                        onPressed: () => (controller.backButtonController)
                            ? Navigator.canPop(context)
                                ? Navigator.pop(context)
                                : null
                            : null,
                        icon: const FaIcon(FontAwesomeIcons.arrowLeft),
                      )
                    : const SizedBox(),
          ),
        ),
        actions: [userIcon(context)],
        centerTitle: true,
        title: const Text(
          'Resources',
          style: TextStyle(fontSize: 30),
        ),
        flexibleSpace: Align(
          alignment: Alignment.bottomLeft,
          child: Stack(
            children: [
              Positioned(
                right: -125,
                bottom: 0,
                child: SvgPicture.asset(
                  "assets/svg/app_bar_leaf.svg",
                  color: Theme.of(context).primaryColor.withOpacity(.2),
                  fit: BoxFit.fitHeight,
                  width: 250,
                ),
              ),
            ],
          ),
        ),
      );

  Widget userIcon(BuildContext context) => Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: GestureDetector(
          child: const Hero(tag: "profile_image", child: UserIcon(radius: 20)),
          onTap: () => Get.toNamed(Routes.PROFILE),
        ),
      );
}
