import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
// import 'package:test/test.dart';

void main() {
  group('DateTest', () {
    test('should return true if lastUpdated is more than 16 hours ago', () {
      // Arrange
      DateTime lastUpdated = DateTime.now().subtract(const Duration(hours: 17));
      DateTest dateTest = DateTest();

      // Act
      bool result = dateTest.shouldUpdate(lastUpdated);

      // Assert
      expect(result, true);
    });

    test('should return false if lastUpdated is within 16 hours', () {
      // Arrange
      DateTime lastUpdated = DateTime.now().subtract(Duration(hours: 15));
      DateTest dateTest = DateTest();

      // Act
      bool result = dateTest.shouldUpdate(lastUpdated);

      // Assert
      expect(result, false);
    });

    test('should return false if lastUpdated is null', () {
      // Arrange
      DateTime? lastUpdated = null;
      DateTest dateTest = DateTest();

      // Act
      bool result = dateTest.shouldUpdate(lastUpdated);

      // Assert
      expect(result, false);
    });
  });
}

class DateTest {
  bool shouldUpdate(DateTime? lastUpdated) {
    // if last updated is not null and is more than 16 hours then update it
    if (lastUpdated != null &&
        lastUpdated.difference(DateTime.now()).inHours.abs() > 16) {
      return true;
    } else {
      return false;
    }
  }
}
