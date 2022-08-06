import 'dart:convert';

class MapLocation {
  final String name;
  final double latitude;
  final double longitude;
  final String? addedBy;
  final String? description;
  final Tags tags;
  final bool varified;
  final String? refId;
  final DateTime createdDate;
  const MapLocation(
      {required this.name,
      required this.latitude,
      required this.longitude,
      this.addedBy,
      this.description,
      required this.tags,
      this.varified = false,
      this.refId,
      required this.createdDate});

  MapLocation copyWith(
          {String? name,
          double? latitude,
          double? longitude,
          String? addedBy,
          String? description,
          Tags? tags,
          bool? varified,
          String? refId,
          DateTime? createdDate}) =>
      MapLocation(
          name: name ?? this.name,
          latitude: latitude ?? this.latitude,
          longitude: longitude ?? this.longitude,
          addedBy: addedBy ?? this.addedBy,
          description: description ?? this.description,
          tags: tags ?? this.tags,
          varified: varified ?? this.varified,
          refId: refId ?? this.refId,
          createdDate: createdDate ?? this.createdDate);

  Map<String, dynamic> get toMap => <String, dynamic>{
        'name': name,
        'latitude': latitude,
        'longitude': longitude,
        'addedBy': addedBy,
        'description': description,
        'tags': tags.toMap,
        'varified': varified,
        'refId': refId,
        'createdDate': createdDate.millisecondsSinceEpoch
      };

  factory MapLocation.fromMap(Map<String, dynamic> map) => MapLocation(
      name: map['name'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      addedBy: map['addedBy'] != null ? map['addedBy'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      tags: Tags.fromMap(map['tags'] as Map<String, dynamic>),
      varified: map['varified'] as bool,
      refId: map['refId'] as String?,
      createdDate:
          DateTime.fromMillisecondsSinceEpoch(map['createdDate'] as int));

  String toJson() => json.encode(toMap);

  factory MapLocation.fromJson(String source) =>
      MapLocation.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Tags {
  final List<String> tags;
  const Tags({required this.tags});

  Tags copyWith({List<String>? tags}) => Tags(tags: tags ?? this.tags);

  Map<String, dynamic> get toMap => <String, dynamic>{'tags': tags};

  factory Tags.fromMap(Map<String, dynamic> map) =>
      Tags(tags: List<String>.from((map['tags'] as List<String>)));

  String toJson() => json.encode(toMap);

  factory Tags.fromJson(String source) =>
      Tags.fromMap(json.decode(source) as Map<String, dynamic>);
}
