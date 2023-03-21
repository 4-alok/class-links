import '../../../global/const/const.dart';
import '../../../global/models/time_table/time_table.dart';

/// It's a class that contains a list of days, each day has a name and a list of subjects
abstract class FirestoreServiceUtils {
  List<Day> get defaultDays => List.generate(
        7,
        (index) => Day(day: Days.days[index], subjects: []),
      );
}
