class GSheetUtils {
  static const gsDateBase = 2209161600 / 86400;
  static const gsDateFactor = 86400000;

  static String getGSheetsId(String idOrUrl) =>
      idOrUrl.contains("/") ? idOrUrl.split("/")[5] : idOrUrl;

  static double dateToGsheetsDate(DateTime dateTime, {bool localTime = true}) {
    final offset = dateTime.millisecondsSinceEpoch / gsDateFactor;
    final shift = localTime ? dateTime.timeZoneOffset.inHours / 24 : 0;
    return gsDateBase + offset + shift;
  }

  static DateTime? gsheetsDateToDate(String value, {bool localTime = true}) {
    final date = double.tryParse(value);
    if (date == null) return null;
    final millis = (date - gsDateBase) * gsDateFactor;
    return DateTime.fromMillisecondsSinceEpoch(millis.toInt(),
        isUtc: localTime);
  }

  static Map<String, dynamic> rowToMap(
      List<String> titleRow, List<String> row) {
    var data = <String, dynamic>{};
    for (int i = 0; i < titleRow.length; i++) {
      if (titleRow[i].toLowerCase() == 'date') {
        data[titleRow[i]] = gsheetsDateToDate(row[i]) ?? "";
      } else {
        data[titleRow[i]] = row[i];
      }
    }
    return data;
  }
}
