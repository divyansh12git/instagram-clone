import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/utils/global.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import 'package:instagram/model/userdata.dart' as model;
import '../utils/colors.dart';

class AppScreenLayout extends StatefulWidget {
  const AppScreenLayout({super.key});

  @override
  State<AppScreenLayout> createState() => _AppScreenLayoutState();
}

class _AppScreenLayoutState extends State<AppScreenLayout> {
  String username = "";


  //one way to get acces to data base
  //cons is we have to write more code

  // @override
  // void initState() {
  //   super.initState();
  //   getUsername();
  // }

  // void getUsername() async {
  //   DocumentSnapshot snap = await FirebaseFirestore.instance
  //       .collection('user')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get();
  //   print(snap.data());
  //   setState((){
  //     username=(snap.data() as Map<String,dynamic>)['username'];
  //   });
  // }

  int _page = 0;
  late PageController pageController;
  @override
  void initState(){
    super.initState();
    pageController=PageController();
  }
  @override
  // void dispose(){
  //    super.initState();
  //   pageController=PageController();
  // }


  void navigationTab(int page){
    pageController.jumpToPage(page);

  }
  void onPageChange(int page){
    setState(() {
      _page=page;
    });
  }
  @override
  Widget build(BuildContext context) {
    //state managent thu provider
    //in which we can get our user data for different users
    // just for demo

    /// model.User user=Provider.of<UserProvider>(context).getUser;

    //

    return Scaffold(
      body:PageView(
        children:homeScreenItems,
        physics:const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChange,
      ),



      bottomNavigationBar:
          CupertinoTabBar(backgroundColor: mobileBackgroundColor, items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color: _page == 0 ? primaryColor : secondaryColor),
            label: '',
            backgroundColor: primaryColor),
        BottomNavigationBarItem(
            icon: Icon(Icons.search,
                color: _page == 1 ? primaryColor : secondaryColor),
            label: '',
            backgroundColor: primaryColor),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_circle,
                color: _page == 2 ? primaryColor : secondaryColor),
            label: '',
            backgroundColor: primaryColor),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded,
                color: _page == 3 ? primaryColor : secondaryColor),
            label: '',
            backgroundColor: primaryColor),
        BottomNavigationBarItem(
            icon: Icon(Icons.person,
                color: _page == 4 ? primaryColor : secondaryColor),
            label: '',
            backgroundColor: primaryColor),
      ],
      onTap:navigationTab ,
      
      
      ),
    );
  }
}
