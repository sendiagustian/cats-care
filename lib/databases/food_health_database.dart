import 'package:catscare/models/food_health_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FoodHealthDatabase {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Nama Collection
  String collectionPath = 'foodHealth';

  // Query Create Document
  Future<String?> create(FoodHealtModel foodHealtModel) async {
    await firestore
        .collection(collectionPath)
        .doc()
        .set(foodHealtModel.toData());
  }

  // Query Stream
  Stream<QuerySnapshot<FoodHealtModel>> streamTypeCats() {
    return firestore.collection(collectionPath).withConverter<FoodHealtModel>(
      fromFirestore: (DocumentSnapshot<Map<String, dynamic>> snapshot, _) {
        return FoodHealtModel.fromData(snapshot);
      },
      toFirestore: (FoodHealtModel model, _) {
        return model.toData();
      },
    ).snapshots();
  }

  // Query Get Collection
  Future<QuerySnapshot<FoodHealtModel>> readTpeCats() async {
    return await firestore
        .collection(collectionPath)
        .withConverter<FoodHealtModel>(
      fromFirestore: (DocumentSnapshot<Map<String, dynamic>> snapshot, _) {
        return FoodHealtModel.fromData(snapshot);
      },
      toFirestore: (FoodHealtModel model, _) {
        return model.toData();
      },
    ).get();
  }

  // Query Get 1 Dokumen
  Future<DocumentSnapshot<FoodHealtModel>?> readTypeCat(String? docId) async {
    return await firestore
        .collection(collectionPath)
        .doc(docId)
        .withConverter<FoodHealtModel>(
      fromFirestore: (DocumentSnapshot<Map<String, dynamic>> snapshot, _) {
        return FoodHealtModel.fromData(snapshot);
      },
      toFirestore: (FoodHealtModel model, _) {
        return model.toData();
      },
    ).get();
  }

  // Query Update Dokumen
  Future update(
    DocumentReference reference, {
    required Map<String, dynamic> data,
  }) async {
    return await reference.update(data);
  }

  // Query Delete
  Future delete(DocumentReference reference) async {
    return await reference.delete();
  }

  // Query Ckeck Document
  Future<bool> checkDocExists({
    String? docID,
  }) async {
    final DocumentSnapshot data =
        await firestore.collection(collectionPath).doc(docID).get();
    return data.exists;
  }
}
