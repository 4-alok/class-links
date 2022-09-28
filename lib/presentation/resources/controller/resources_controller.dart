import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../global/const/app_credentials.dart';
import '../../../global/models/resources/resources_entities.dart';
import '../../../services/gsheet/datasources/resources_datasources.dart';
import '../../../services/gsheet/repository/gsheet_service.dart';

const String indexKey = "index_key";

List<IndexEntity> _getList(Map<String, dynamic> arguments) {
  final path = arguments['path'] as String;
  final entities = arguments['entities'] as List<IndexEntity>;
  List<IndexEntity> list = [];

  for (final entity in entities) {
    if (entity.path.startsWith(path)) {
      if (entity is IndexFolder) {
        if (!entity.path.substring(path.length).contains('/')) {
          list.add(entity);
        }
      } else {
        if (!entity.path.substring(path.length).contains('/')) {
          list.add(entity);
        }
      }
    }
  }

  list = _sortList(list);
  return list;
}

List<IndexEntity> _sortList(List<IndexEntity> list) {
  list.sort((a, b) {
    if (a is IndexFolder && b is IndexFile) {
      return -1;
    } else if (a is IndexFile && b is IndexFolder) {
      return 1;
    } else {
      return a.name.compareTo(b.name);
    }
  });
  return list;
}

class ResourcesController extends GetxController {
  final hasData = ValueNotifier<bool>(false);
  final processing = ValueNotifier<bool>(false);
  final data = Rx<List<List<String>>?>(null);
  final currentEntity = ValueNotifier<List<IndexEntity>>([]);
  final currentPath = ValueNotifier<String>(baseFolder);

  ResourcesDatasources get resourcesReop =>
      Get.find<GSheetService>().resourcesDatasources;

  @override
  void onReady() async {
    data.value = (await resourcesReop.getResourcesListCache)?.rowList;
    if (data.value != null) hasData.value = true;
    data.value = (await resourcesReop.getResourcesList).rowList;
    hasData.value = true;
    currentEntity.value = getEntities;
    super.onReady();
  }

  Future<List<IndexEntity>> getList(String path) async {
    processing.value = true;
    currentEntity.value =
        await compute(_getList, {'path': path, 'entities': getEntities});
    processing.value = false;
    return currentEntity.value;
  }

  List<IndexEntity> get getEntities => data.value == null
      ? []
      : List.generate(
          data.value!.length,
          (index) => data.value![index][2] == "Folder"
              ? IndexFolder(
                  name: data.value![index][1],
                  path: data.value![index][0],
                  lastUpdate: data.value![index][5])
              : IndexFile(
                  name: data.value![index][1],
                  path: data.value![index][0],
                  lastUpdate: data.value![index][5],
                  id: data.value![index][4],
                  description: data.value![index][6] == ""
                      ? null
                      : data.value![index][6],
                  size: double.tryParse(data.value![index][7]) ?? -1,
                ),
        );

  bool get backButtonController {
    if (currentPath.value != baseFolder) {
      final k =
          currentPath.value.substring(0, currentPath.value.lastIndexOf('/'));
      currentPath.value = "${k.substring(0, k.lastIndexOf('/'))}/";
      return false;
    } else {
      return true;
    }
  }

  String kiloBytesToString(double size) => size < 0
      ? "Unknown"
      : size < 1024
          ? "${size.toStringAsFixed(2)} KB"
          : "${(size / 1024).toStringAsFixed(2)} MB";

  @override
  void dispose() {
    hasData.dispose();
    processing.dispose();
    currentPath.dispose();
    data.close();
    super.dispose();
  }
}
