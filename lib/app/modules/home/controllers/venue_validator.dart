class VenueValidator {
  static const message = "Enter a valid venue, ie: CLH201";
  static String? validate(String? venue) {
    if (venue != null) {
      if (venue == "") {
        return null;
      }
      if (venue.startsWith("CLH") || venue.startsWith("CWL")) {
        if (venue.length == 6) {
          return null;
        }
      }
      return message;
    } else {
      return null;
    }
  }
}
