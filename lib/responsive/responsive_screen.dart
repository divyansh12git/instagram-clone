import 'package:flutter/material.dart';
import 'package:instagram/utils/global.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  const ResponsiveLayout({
    Key? key,
    required this.mobileScreenLayout,
    required this.webScreenLayout,
  }) :super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  

//state managenet refreshing user
  void initState(){
    super.initState();
    addData();
  }
  addData() async {
    UserProvider _userProvider=Provider.of(context,listen:false);
    await _userProvider.refreshUser();
  
  }
  
// doone state managenent
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      if(constraints.maxWidth >webScreenSize){
          return widget.webScreenLayout;
      }
      else{
        return widget.mobileScreenLayout;
      }
    });
  }
}