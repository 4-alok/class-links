import '../../../utils/extension.dart';

import '../../../models/time_table/time_table.dart';

abstract class MyReorderableLIstUtils {
  String trailingText(Subject item) {
    final _roomNo = item.roomNo;
    if (_roomNo == null) {
      return "";
    } else {
      try {
        final map = _roomNo.splitString;

        final s1 = map.keys.first;
        final s2 = map.values.first;
        return (item.googleClassRoomLink == "" && item.zoomLink == "")
            ? s2
            : s1 + "-" + s2;
      } catch (e) {
        return _roomNo;
      }
    }
  }

  String displayTileText(Subject item) {
    List<String> subtitle = [];
    if (item.googleClassRoomLink != "") subtitle.add("Google Meet");
    if (item.zoomLink != "") subtitle.add("Zoom Meet");
    if (item.roomNo != null) {
      if (item.roomNo != "" && subtitle.isEmpty) {
        final map = item.roomNo!.splitString;
        subtitle.add("Room no: ${map.keys.first} - ${map.values.first}");
      }
    }
    return subtitle.join(" | ");
  }
}
