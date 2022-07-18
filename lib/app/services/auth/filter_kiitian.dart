import '../../utils/extension.dart';

abstract class FilterKiitian {
  bool isValidRollNo(int rollNo) {
    // 2nd year CSE
    if (rollNo.isBetween(2005000, 2005999) ||
        rollNo.isBetween(20051000, 20052010)) {
      return true;
    }
    // 2nd year IT
    else if (rollNo.isBetween(2006001, 2006568)) {
      return true;
    }
    // 1st year CSE and IT
    else if (rollNo.isBetween(2105000, 2105999) ||
        rollNo.isBetween(21051000, 21054000)) {
      return true;
    }

    // 3rd year CSSE
    else if (rollNo.isBetween(2028001, 2028214)) {
      return true;
    }

    // 3rd year CSCE
    else if (rollNo.isBetween(2029001, 2029214)) {
      return true;
    }
    return false;
  }
}
