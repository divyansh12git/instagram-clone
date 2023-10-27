import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source, Uint8List? img) async {
  final ImagePicker imagePicker = ImagePicker();
  
  XFile? file = await imagePicker.pickImage(source: source);
  
  if (file != Null) {
    Uint8List? newimg=await file?.readAsBytes();
    
    return newimg;
     
  }
  print("No file has been selected");

}

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}
