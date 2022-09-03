import 'package:class_link/services/hive/repository/hive_database.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:gsheets/gsheets.dart';

import '../../../global/const/credentials.dart';
import '../../../global/models/resources/resources_entities.dart';

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
  final gsheets = GSheets(credentials);
  final hasData = ValueNotifier<bool>(false);
  final processing = ValueNotifier<bool>(false);
  List<List<String>>? data;
  final currentEntity = ValueNotifier<List<IndexEntity>>([]);

  final currentPath = ValueNotifier<String>(baseFolder);

  @override
  void onReady() {
    getData;
    super.onReady();
  }

  Future<List<IndexEntity>> getList(String path) async {
    processing.value = true;
    currentEntity.value =
        await compute(_getList, {'path': path, 'entities': getEntities});
    processing.value = false;
    return currentEntity.value;
  }

  List<IndexEntity> get getEntities => data == null
      ? []
      : List.generate(
          data!.length,
          (index) => data![index][2] == "Folder"
              ? IndexFolder(
                  name: data![index][1],
                  path: data![index][0],
                  lastUpdate: data![index][5])
              : IndexFile(
                  name: data![index][1],
                  path: data![index][0],
                  lastUpdate: data![index][5],
                  id: data![index][4],
                  description: data![index][6] == "" ? null : data![index][6],
                  size: double.tryParse(data![index][7]) ?? -1,
                ),
        );

  Future<void> get getData async => await readSheetData('index').then((value) {
        data = value;
        hasData.value = true;
      });

  String get getGSheetsId =>
      sheetURL.contains("/") ? sheetURL.split("/")[5] : sheetURL;

  Future<List<List<String>>> readSheetData(String sheetTitle) async =>
      await gsheets.spreadsheet(getGSheetsId).then(
          (value) => value.worksheetByTitle(sheetTitle)!.values.allRows());

  bool get backButtonController {
    if (currentPath.value != baseFolder) {
      final k =
          currentPath.value.substring(0, currentPath.value.lastIndexOf('/'));
      currentPath.value = "${k.substring(0, k.lastIndexOf('/'))}/";
      return false;
    }
    return true;
  }

  String kiloBytesToString(double size) {
    if (size < 0) {
      return "Unknown";
    } else if (size < 1024) {
      return "${size.toStringAsFixed(2)} KB";
    } else {
      return "${(size / 1024).toStringAsFixed(2)} MB";
    }
  }

  @override
  void dispose() {
    gsheets.close();
    hasData.dispose();
    processing.dispose();
    currentPath.dispose();
    super.dispose();
  }
}
