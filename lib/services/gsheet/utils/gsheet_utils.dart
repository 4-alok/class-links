import '../../hive/models/user_info.dart';

const gsDateBase = 2209161600 / 86400;
const gsDateFactor = 86400000;

mixin GSheetUtils {
  List userToSheetRow(UserInfo user) => [
        user.id,
        user.slot,
        user.batch,
        user.stream,
        user.year,
        dateToGsheets(user.date),
        user.userName,
        user.role
      ];

  UserInfo sheetRowToUser(List row) => UserInfo(
        id: row[0],
        slot: int.tryParse(row[1]) ?? -1,
        batch: row[2],
        stream: row[3],
        year: int.tryParse(row[4]) ?? -1,
        date: dateFromGsheets(row[5]) ?? DateTime.now(),
        userName: row[6],
        role: row[7],
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
