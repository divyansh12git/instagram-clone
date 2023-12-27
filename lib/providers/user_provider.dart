import 'package:flutter/material.dart';
import 'package:instagram/model/userdata.dart';
import 'package:instagram/resources/auth.dart';


class UserProvider with ChangeNotifier{
    User? _user;
     final AuthMethod _authMethod= AuthMethod();
    User get getUser=>_user!;

    Future<void> refreshUser()async{
      User user= await _authMethod.getUserDetails();
      _user=user;
      notifyListeners();


    }
}