// import 'dart:io';

// import "package:path_provider/path_provider.dart";

// class StorageUtils {
//   // Get the directory to store the music database or thumbnails,
//   static Future<String> get getDocDir async {
//     if (Platform.isAndroid) {
//       final String dirPath =
//           (await getExternalStorageDirectories())!.first.path;
//       return dirPath;
//     }
//     return "";
//   }

//   // Get the available directory to scan
//   static Future<List<Directory>> getAvailableStorage() async {
//     if (Platform.isLinux) {
//       final Directory dir = await getApplicationDocumentsDirectory();
//       return [dir.parent];
//     } else if (Platform.isAndroid) {
//       return await _getAndroidStorageList();
//     } else {
//       return [];
//     }
//   }

//   static Future<List<Directory>> _getAndroidStorageList() async {
//     List<Directory> storages = (await getExternalStorageDirectories())!;
//     if (storages.isNotEmpty) {
//       storages = storages.map((Directory e) {
//         final List<String> splitedPath = e.path.split("/");
//         return Directory(splitedPath
//             .sublist(
//                 0, splitedPath.indexWhere((element) => element == "Android"))
//             .join("/"));
//       }).toList();
//     } else {
//       return [];
//     }
//     return storages;
//   }
// }
