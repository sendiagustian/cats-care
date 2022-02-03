import 'package:cloud_firestore/cloud_firestore.dart';

class TypeCatModel {
  final DocumentReference? reference;
  final String title;
  final String cover;
  final String content;

  TypeCatModel({
     this.reference,
    required this.title,
    required this.cover,
    required this.content,
  });

  factory TypeCatModel.fromData(DocumentSnapshot doc) {
    return TypeCatModel(
      reference: doc.reference,
      title: doc.get('title'),
      cover: doc.get('cover'),
      content: doc.get('content'),
    );
  }

  Map<String, dynamic> toData() {
    return {
      'reference': reference,
      'title': title,
      'cover': cover,
      'content': content,
    };
  }
}
