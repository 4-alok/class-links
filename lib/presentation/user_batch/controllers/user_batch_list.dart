mixin UserBatchList {
  static const _firstYearScheme1 = <String>[];

  static const _firstYearScheme2 = <String>[];

  List<String> get firstYearScheme1 => _firstYearScheme1;

  List<String> get firstYearScheme2 => _firstYearScheme2;

  // 2nd Year

  List<String> get secondYearCSE =>
      List.generate(40, (index) => "CSE ${index + 1}");

  List<String> get secondYearIT =>
      List.generate(4, (index) => "IT ${index + 1}");

  List<String> get secondYearCSSE =>
      List.generate(2, (index) => "CSSE ${index + 1}");

  List<String> get secondYearCSCE =>
      List.generate(2, (index) => "CSCE ${index + 1}");

  // 3rd Year

  List<String> get thirdYearCSE =>
      List.generate(26, (index) => "CSE-${index + 1}");

  List<String> get thirdYearIT =>
      List.generate(7, (index) => "IT-${index + 1}");

  List<String> get thirdYearCSSE =>
      List.generate(3, (index) => "CSSE-${index + 1}");
}
