import 'user_batch_controller.dart';

class UserBatchList {
  static Map<int, Map<CurrentStream, List<String>>> get yearStreamMap => {
        3: {
          CurrentStream.CSE: List.generate(39, (index) => "CSE-${index + 1}"),
          CurrentStream.IT: List.generate(4, (index) => "IT-${index + 1}"),
          CurrentStream.CSSE: List.generate(1, (index) => "CSSE-${index + 1}"),
          CurrentStream.CSCE: List.generate(2, (index) => "CSCE-${index + 1}"),
        },
        2: {
          CurrentStream.CSE: List.generate(55, (index) => "CSE-${index + 1}"),
          CurrentStream.IT: List.generate(5, (index) => "IT-${index + 1}"),
          CurrentStream.CSSE: List.generate(3, (index) => "CSSE-${index + 1}"),
          CurrentStream.CSCE: List.generate(2, (index) => "CSCE-${index + 1}"),
        },
      };
}
