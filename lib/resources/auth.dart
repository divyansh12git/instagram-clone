import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram/resources/storage_method.dart';



class AuthMethod{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
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
        if(email.isNotEmpty || password.isNotEmpty || username.isNotEmpty || bio.isNotEmpty || file !=Null ){
          //register user
         UserCredential cred= await _auth.createUserWithEmailAndPassword(email: email, password: password);
          print(cred.user!.uid);


        String photoUrl=await StorageMethod().uploadImageToStorage('profilePics',file, false);



          //add user to our database
          await _firestore.collection("user").doc(cred.user!.uid).set({
            'username':username,
            'uid':cred.user!.uid,
            'email':email,
            'bio':bio,
            'followers':[],
            'following':[],
            'photoUrl':photoUrl,
          });

          res="success";
        return res;
       
       
        }
      } on FirebaseAuthException catch(err){    //firebase se exception hone par ye catch karega
        if(err.code == 'invalid-email'){
          res='The Email is Badly formatted.';
        }
      }
      
      catch(err){
        res=err.toString();
        return res;
      }
      return "done";
  }
}