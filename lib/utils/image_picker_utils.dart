import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';

class PickImage {
  ImagePicker picker = ImagePicker();

  /// Return File Image Gallery, if [imageQuality] is set, auto resize picked
  /// File, then return the resize file image.
  /// [imageQuality] % compress from the original image,
  Future<File> getImageGallery(
      {int imageQuality = 100, double? maxWidth}) async {
    if (await Permission.storage.status.isGranted) {
    } else {
      await Permission.storage.request();
    }
    XFile? pickImage = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: maxWidth,
      imageQuality: imageQuality,
    );
    if (pickImage != null) {
      return File(pickImage.path);
    } else {
      return File('');
    }
  }

  /// Return File Image Camera, if [imageQuality] is set, auto resize picked
  /// File, then return the resize file image.
  /// [imageQuality] % compress from the original image,
  Future<File?> getImageCamera(
      {int imageQuality = 100, double? maxWidth}) async {
    try {
      XFile? pickImage = await picker.pickImage(
        source: ImageSource.camera,
        maxWidth: maxWidth,
        imageQuality: imageQuality,
      );
      if (pickImage != null) {
        return File(pickImage.path);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<File?> pickImageGallery(
      {int imageQuality = 100, double? maxWidth}) async {
    PermissionStatus status = await Permission.storage.status;
    File? image;
    if (status.isGranted) {
      XFile? pickImage = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: maxWidth,
        imageQuality: imageQuality,
      );
      if (pickImage != null) {
        image = File(pickImage.path);
      } else {}
    } else {
      PermissionStatus status = await Permission.storage.request();
      if (status.isGranted) {
        return await pickImageGallery(
            imageQuality: imageQuality, maxWidth: maxWidth);
      }
    }

    return image;
  }

  static Future<UploadTask?> uploadImageToStorage({
    required BuildContext context,
    required String refPath,
    required File file,
  }) async {
    try {
      final ref = FirebaseStorage.instance.ref(refPath);
      return ref.putFile(file);
    } on FirebaseException catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
    return null;
  }
}
