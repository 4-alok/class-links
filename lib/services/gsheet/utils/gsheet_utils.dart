import '../../hive/models/user_info.dart';

const gsDateBase = 2209161600 / 86400;
const gsDateFactor = 86400000;

mixin GSheetUtils {
  List userToSheetRow(UserInfo user) => [
        user.refId ?? "",
        user.id,
        user.userName,
        user.semester,
        user.stream,
        user.batch,
        user.role,
        dateToGsheets(user.joiningDate),
        user.lastUpdated != null ? dateToGsheets(user.lastUpdated!) : "",
        user.electiveSections.firstOrNull ?? "",
        user.electiveSections.lastOrNull ?? "",
      ];

  UserInfo sheetRowToUser(List row) => UserInfo(
        id: row[1],
        userName: row[2],
        semester: int.parse(row[3]),
        stream: row[4],
        batch: row[5],
        role: row[6],
        joiningDate: dateFromGsheets(row[7]) ?? DateTime.now(),
        lastUpdated: (row.length > 8) ? dateFromGsheets(row[8]) : null,
        electiveSections: (row.length > 9) ? [row[9], row[10]] : [],
      );

  double dateToGsheets(DateTime dateTime, {bool localTime = true}) {
    final offset = dateTime.millisecondsSinceEpoch / gsDateFactor;
    final shift = localTime ? dateTime.timeZoneOffset.inHours / 24 : 0;
    return gsDateBase + offset + shift;
  }

  DateTime? dateFromGsheets(String value, {bool localTime = true}) {
    final date = double.tryParse(value);
    if (date == null) return null;
    final millis = (date - gsDateBase) * gsDateFactor;
    return DateTime.fromMillisecondsSinceEpoch(millis.toInt(),
        isUtc: localTime);
  }
}
