class VenueValidator {
  static const message = "Enter a valid room number";
  static String? validate(String? venue) {
    if (venue != null) {
      if (venue == "") {
        return null;
      } else if (venue == "D4" || venue == "D5") {
        return null;
      } else if (venue.startsWith("CLH") || venue.startsWith("CWL")) {
        if (venue.length == 6) return null;
      } else if (venue.startsWith("C")) {
        if (venue.length == 4) return null;
      } else if (venue.startsWith("OAT")) {
        if (venue.length == 4) return null;
      } else if (venue.length == 3 && _isNumeric(venue)) {
        return null;
      }
      return message;
    } else {
      return null;
    }
  }

  static bool _isNumeric(String str) => double.tryParse(str) != null;
}
