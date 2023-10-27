import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram/responsive/mobileScreenLayout.dart';
import 'package:instagram/responsive/responsive_screen.dart';
import 'package:instagram/responsive/webscreenLayout.dart';
import 'package:instagram/screens/login_screen.dart';
import 'package:instagram/screens/signup_screen.dart';
import 'package:instagram/utils/colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor:mobileBackgroundColor ),
      debugShowCheckedModeBanner: false,
      
      
      // home: ResponsiveLayout(mobileScreenLayout: AppScreenLayout(), webScreenLayout: WebScreenLayout()));
        home:LoginScreen(),
        );
  }
}

