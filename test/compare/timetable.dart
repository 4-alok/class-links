import 'package:class_link/app/models/time_table/time_table.dart';

class TT {
  static bool dayEqual(Day d1, Day d2) {
    try {
      for (int i = 0; i < d1.subjects.length; i++) {
        print(d1.subjects[i]);
        print(d2.subjects[i]);
        if (d1.subjects[i] != d2.subjects[i]) {
          return false;
        }
      }
    } catch (e) {
      return false;
    }
    return true;
  }
}
