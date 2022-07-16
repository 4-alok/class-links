// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserSecetion {
  final int rollNo;
  final String name;
  final String section;
  final String elective1Section;
  final String elective2Section;
  const UserSecetion({
    required this.rollNo,
    required this.name,
    required this.section,
    required this.elective1Section,
    required this.elective2Section,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rollNo': rollNo,
      'name': name,
      'section': section,
      'elective1Section': elective1Section,
      'elective2Section': elective2Section,
    };
  }

  factory UserSecetion.fromMap(Map<String, dynamic> map) {
    return UserSecetion(
      rollNo: map['rollNo'] as int,
      name: map['name'] as String,
      section: map['section'] as String,
      elective1Section: map['elective1Section'] as String,
      elective2Section: map['elective2Section'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserSecetion.fromJson(String source) =>
      UserSecetion.fromMap(json.decode(source) as Map<String, dynamic>);
}
