import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/map_location.dart';
import '../usecase/map_usecase.dart';

const String kiitMapLocation = 'kiit_map_location';

class MapServiceDatasources implements MapServiceUsecase {
  final FirebaseFirestore firestore;
  MapServiceDatasources({required this.firestore});

  @override
  Future addLocation(MapLocation location) async =>
      await firestore.collection(kiitMapLocation).add(location.toMap);

  @override
  Future deleteLocation(String refId) async =>
      await firestore.collection(kiitMapLocation).doc(refId).delete();

  @override
  Future<List<MapLocation>> get getAllLocation async {
    final res = await firestore
        .collection(kiitMapLocation)
        .where('verifired', isEqualTo: true)
        .get();
    return res.docs.map((e) => MapLocation.fromMap(e.data())).toList();
  }

  @override
  Future updateLocation(MapLocation location, String refId) async =>
      await firestore
          .collection(kiitMapLocation)
          .doc(refId)
          .update(location.toMap);
}
