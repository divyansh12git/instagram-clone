import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram/resources/storage_method.dart';
import 'package:instagram/model/userdata.dart' as model;

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //sign up the user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String bio,
    required String username,
    required Uint8List file,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file != Null) {
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);

        String photoUrl = await StorageMethod()
            .uploadImageToStorage('profilePics', file, false);

        model.User user = model.User(
          username: username,
          uid: cred.user!.uid,
          email: email,
          bio: bio,
          followers: [],
          following: [],
          photoUrl: photoUrl,
        );

        //add user to our database
        await _firestore
            .collection("user")
            .doc(cred.user!.uid)
            .set(user.toJson());

        res = "success";
      }
    } on FirebaseAuthException catch (err) {
      //firebase se exception hone par ye catch karega
      if (err.code == 'invalid-email') {
        res = 'The Email is Badly formatted.';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  //login the user

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some errror occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "enter all the fields";
      }
    }
    //customize error but firebase give pretty good propss so not needed
    on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        res = "User not found";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
