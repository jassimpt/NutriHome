import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends ChangeNotifier {
  File? selectedimage;
  void selectImage({required source}) async {
    final returnedImage = await ImagePicker().pickImage(source: source);
    if (returnedImage != null) {
      selectedimage = File(returnedImage.path);
      notifyListeners();
    }
  }
}
