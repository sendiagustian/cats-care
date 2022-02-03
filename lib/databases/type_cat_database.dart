import 'package:catscare/models/type_cat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TypeCatDatabase {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Nama Collection
  String collectionPath = 'typeCats';

  // Query Create Document
  Future<String?> create(TypeCatModel typeCatModel) async {
    await firestore.collection(collectionPath).doc().set(typeCatModel.toData());
  }

  // Query Stream
  Stream<QuerySnapshot<TypeCatModel>> streamTypeCats() {
    return firestore.collection(collectionPath).withConverter<TypeCatModel>(
      fromFirestore: (DocumentSnapshot<Map<String, dynamic>> snapshot, _) {
        return TypeCatModel.fromData(snapshot);
      },
      toFirestore: (TypeCatModel model, _) {
        return model.toData();
      },
    ).snapshots();
  }

  // Query Get Collection
  Future<QuerySnapshot<TypeCatModel>> readTpeCats() async {
    return await firestore
        .collection(collectionPath)
        .withConverter<TypeCatModel>(
      fromFirestore: (DocumentSnapshot<Map<String, dynamic>> snapshot, _) {
        return TypeCatModel.fromData(snapshot);
      },
      toFirestore: (TypeCatModel model, _) {
        return model.toData();
      },
    ).get();
  }

  // Query Get 1 Dokumen
  Future<DocumentSnapshot<TypeCatModel>?> readTypeCat(String? docId) async {
    return await firestore
        .collection(collectionPath)
        .doc(docId)
        .withConverter<TypeCatModel>(
      fromFirestore: (DocumentSnapshot<Map<String, dynamic>> snapshot, _) {
        return TypeCatModel.fromData(snapshot);
      },
      toFirestore: (TypeCatModel model, _) {
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
