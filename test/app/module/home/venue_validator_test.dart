import 'package:class_link/app/modules/home/controllers/venue_validator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([VenueValidator])
void main() {
  group("Valid Case", () {
    test("Venue case 1", () {
      final res = VenueValidator.validate("CLH201");
      expect(res, isNull);
    });

    test("Venue case 2", () {
      final res = VenueValidator.validate("CWL201");
      expect(res, isNull);
    });

    test("Venue case 3", () {
      final res = VenueValidator.validate(null);
      expect(res, isNull);
    });

    test("Venue case 4", () {
      final res = VenueValidator.validate("");
      expect(res, isNull);
    });
  });

  group("Invalid Case", () {
    test("Invalid Venue case 1", () {
      final res = VenueValidator.validate("XXX201");
      expect(res, isNotNull);
    });

    test("Invalid Venue case 2", () {
      final res = VenueValidator.validate("XXX201X");
      expect(res, isNotNull);
    });

    test("Invalid Venue case 3", () {
      final res = VenueValidator.validate("CLH201XXX");
      expect(res, isNotNull);
    });
  });
}
