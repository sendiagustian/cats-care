import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image/image.dart';
import 'package:image/image.dart' as img;
import 'package:mime_type/mime_type.dart';
import 'package:path/path.dart';

class StorageUtil {
  static Future<Map> uploadFile(
      {required String path,
      required File file,
      bool? withThumbnail,
      String? userId}) async {
    String directory = path;
    String fileName = basename(file.path);
    String? mimeType = mime(basename(file.path));
    String gambar = (directory) + fileName;
    Reference ref = FirebaseStorage.instance.ref().child(gambar);
    UploadTask uploadTask = ref.putFile(file);

    String downUrl = await (await uploadTask).ref.getDownloadURL();
    String url = downUrl.toString();
    Map data = {
      'directory': directory,
      'metadata': mimeType,
      'name': fileName,
      'size': file.lengthSync(),
      'type': 'File',
      'url': url,
      'uploadAt': FieldValue.serverTimestamp(),
      'uploader': userId,
    };
    await FirebaseFirestore.instance
        .collection('drives')
        .add(Map<String, dynamic>.from(data));

    if (withThumbnail != null &&
        withThumbnail &&
        (mimeType ?? '').contains('image')) {
      img.Image? iemge = decodeImage(file.readAsBytesSync());
      if (iemge != null) {
        img.Image thumbnail = copyResize(
          iemge,
          width: 180,
          interpolation: Interpolation.average,
        );
        File fileThumbnail = file..writeAsBytesSync(encodeJpg(thumbnail));
        String gambar = (directory) + 'thumbnail' + fileName;
        Reference ref = FirebaseStorage.instance.ref().child(gambar);
        UploadTask uploadTask = ref.putFile(fileThumbnail);
        String? mimeType = mime(basename(fileThumbnail.path));
        String downUrl = await (await uploadTask).ref.getDownloadURL();
        String url = downUrl.toString();
        await FirebaseFirestore.instance.collection('drives').add({
          'directory': directory,
          'metadata': mimeType,
          'name': 'thumbnail' + fileName,
          'size': fileThumbnail.lengthSync(),
          'type': 'File',
          'url': url,
          'uploadAt': FieldValue.serverTimestamp(),
          'uploader': userId,
        });
      }
    }
    return {
      'directory': directory,
      'metadata': mimeType,
      'name': fileName,
      'size': file.lengthSync(),
      'type': 'File',
      'url': url,
      'uploadAt': FieldValue.serverTimestamp(),
      'uploader': userId,
    };
  }

  static Future deleteFile({
    required String url,
  }) async {
    Reference storageReference = FirebaseStorage.instance.ref(url);
    storageReference.delete();
    List<DocumentSnapshot<Map<String, dynamic>>> drives =
        (await FirebaseFirestore.instance
                .collection('drives')
                .where('url', isEqualTo: url)
                .get())
            .docs;
    if (drives.isNotEmpty) {
      for (DocumentSnapshot<Map<String, dynamic>> drive in drives) {
        await drive.reference.delete();
      }
    }
  }
}
