class UserBatchList {
  static Map<int, Map<String, List<String>>> get yearStreamMap => {
        4: {
          "CSE": List.generate(39, (index) => "CSE-${index + 1}"),
          "IT": List.generate(4, (index) => "IT-${index + 1}"),
          "CSSE": List.generate(2, (index) => "CSSE-${index + 1}"),
          "CSCE": List.generate(2, (index) => "CSCE-${index + 1}"),
        },
        6: {
          "CSE": List.generate(55, (index) => "CSE-${index + 1}"),
          "IT": List.generate(5, (index) => "IT-${index + 1}"),
          "CSSE": List.generate(3, (index) => "CSSE-${index + 1}"),
          "CSCE": List.generate(2, (index) => "CSCE-${index + 1}"),
        },
      };
}
