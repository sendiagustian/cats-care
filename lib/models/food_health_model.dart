import 'package:cloud_firestore/cloud_firestore.dart';

class FoodHealtModel {
  final DocumentReference? reference;
  final String title;
  final String cover;
  final String content;

  FoodHealtModel({
    this.reference,
    required this.title,
    required this.cover,
    required this.content,
  });

  factory FoodHealtModel.fromData(DocumentSnapshot doc) {
    return FoodHealtModel(
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
