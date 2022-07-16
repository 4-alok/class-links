extension FirstNumericIndex on String {
  int? get getFirstNumericIndex {
    for (int i = 0; i < length; i++) {
      if (int.tryParse(this[i]) != null) {
        return i;
      }
    }
    return null;
  }
}
