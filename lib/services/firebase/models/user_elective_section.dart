import 'dart:convert';

class UserElectiveSection {
  final int rollNo;
  final String elective1Section;
  final String elective2Section;
  UserElectiveSection({
    required this.rollNo,
    required this.elective1Section,
    required this.elective2Section,
  });

  UserElectiveSection copyWith({
    int? rollNo,
    String? elective1Section,
    String? elective2Section,
  }) {
    return UserElectiveSection(
      rollNo: rollNo ?? this.rollNo,
      elective1Section: elective1Section ?? this.elective1Section,
      elective2Section: elective2Section ?? this.elective2Section,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rollNo': rollNo,
      'elective1Section': elective1Section,
      'elective2Section': elective2Section,
    };
  }

  factory UserElectiveSection.fromMap(Map<String, dynamic> map) {
    return UserElectiveSection(
      rollNo: map['rollNo'] as int,
      elective1Section: map['elective1Section'] as String,
      elective2Section: map['elective2Section'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserElectiveSection.fromJson(String source) =>
      UserElectiveSection.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserElectiveSection(rollNo: $rollNo, elective1Section: $elective1Section, elective2Section: $elective2Section)';

  @override
  bool operator ==(covariant UserElectiveSection other) {
    if (identical(this, other)) return true;

    return other.rollNo == rollNo &&
        other.elective1Section == elective1Section &&
        other.elective2Section == elective2Section;
  }

  @override
  int get hashCode =>
      rollNo.hashCode ^ elective1Section.hashCode ^ elective2Section.hashCode;
}
