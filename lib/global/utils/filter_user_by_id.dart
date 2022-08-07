import '../../services/hive/models/user_info.dart';

List<UserInfo> filterUserById(List<UserInfo> userList) {
  final shortRolls = userList
      .where((element) => element.id.split("@").first.length == 7)
      .toList();
  shortRolls.sort((a, b) => a.id.compareTo(b.id));
  final longRolls = userList
      .where((element) => element.id.split("@").first.length == 8)
      .toList();
  longRolls.sort((a, b) => a.id.compareTo(b.id));
  return shortRolls +
      longRolls +
      userList.where((element) => !element.id.startsWith('20')).toList();
}
