import '../../models/time_table/time_table.dart';
import '../../global/const/const.dart';

abstract class FirestoreServiceUtils {
  List<Day> get defaultDays => List.generate(
        7,
        (index) => Day(day: Days.days[index], subjects: []),
      );
}
