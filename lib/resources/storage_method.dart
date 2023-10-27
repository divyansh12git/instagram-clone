import 'dart:ffi';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';


class StorageMethod{
  final FirebaseStorage _storage= FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> uploadImageToStorage(String childName, Uint8List file, bool isPost)async{



    //refrence pointer to the storage .child .child is folder banaye hai 
    Reference ref=_storage.ref().child(childName).child(_auth.currentUser!.uid);
    
    
    
    // Uint file store karne ke litye putData use kia
    UploadTask uploadTask=ref.putData(file);
  
    TaskSnapshot snap=await uploadTask;



    //uploaded file ka download link le liya
    String downloadUrl=await snap.ref.getDownloadURL();
    return downloadUrl;
  }
}
