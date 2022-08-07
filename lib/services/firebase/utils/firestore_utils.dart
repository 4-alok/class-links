import '../../../global/const/const.dart';
import '../../../global/models/time_table/time_table.dart';

abstract class FirestoreServiceUtils {
  List<Day> get defaultDays => List.generate(
        7,
        (index) => Day(day: Days.days[index], subjects: []),
      );
}
