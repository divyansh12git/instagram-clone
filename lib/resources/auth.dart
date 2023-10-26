import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



class AuthMethod{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore _firebase=FirebaseFirestore.instance;
  //sign up the user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String bio,
    required String username,
    required Uint8List file,
  })async{
      String res="Some error occured";
      try {
        if(email.isNotEmpty || password.isNotEmpty || username.isNotEmpty || bio.isNotEmpty || file !=null){
          //register user
         UserCredential cred= await _auth.createUserWithEmailAndPassword(email: email, password: password);
          //add user to our database

       
       
       return "ice";
        }
      }catch(err){
        res=err.toString();
        return res;
      }
  }
}