import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

class MediaService with ListenableServiceMixin {
  final _picker = ImagePicker();
  final _firebaseStorage = FirebaseStorage.instance;

  Reference get storageRef => _firebaseStorage.ref();

  dynamic getFileFromCloud(Reference ref) async {
    return await ref.getDownloadURL();
  }

  Future<XFile?> getImage({required bool fromGallery}) async {
    return await _picker.pickImage(
      source: fromGallery ? ImageSource.gallery : ImageSource.camera,
    );
  }

  Future<List<XFile>?> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return null;
    }
    final List<XFile>? files = response.files;
    if (files != null) {
      return files;
    } else {
      // print(response.file);
      return null;
    }
  }

  Future<List<XFile>?> getMultiImages() async {
    return await _picker.pickMultiImage();
  }

  dynamic uploadFileToCloud(String path, String name, Reference ref) async {
    File file = File(path);
    try {
      await ref.putFile(file);
    } on FirebaseException {
      // _logger.e(e.message);
    }
  }
}
