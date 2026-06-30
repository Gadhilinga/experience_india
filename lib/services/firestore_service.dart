
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/place_model.dart';

class FirestoreService {

  final FirebaseFirestore firestore =
      FirebaseFirestore.instance;

  Future<List<PlaceModel>> getAllPlaces() async {

    List<PlaceModel> allPlaces = [];

    final snapshot =
        await firestore.collection("places").get();

    for (var doc in snapshot.docs) {

      List places =
          doc.data()['places'] ?? [];

      for (var place in places) {

        allPlaces.add(
          PlaceModel.fromMap(place),
        );
      }
    }

    return allPlaces;
  }
}