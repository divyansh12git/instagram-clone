import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram/providers/user_provider.dart';
import 'package:instagram/responsive/mobileScreenLayout.dart';
import 'package:instagram/responsive/responsive_screen.dart';
import 'package:instagram/responsive/webscreenLayout.dart';
import 'package:instagram/screens/login_screen.dart';
import 'package:instagram/screens/signup_screen.dart';
import 'package:instagram/utils/colors.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Instagram',
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
        debugShowCheckedModeBanner: false,

        // home: ResponsiveLayout(mobileScreenLayout: AppScreenLayout(), webScreenLayout: WebScreenLayout()));
        home: StreamBuilder(
            // stream: FirebaseAuth.instance.idTokenChanges(),//whenever token changes it run

            // stream: FirebaseAuth.instance.userChanges(),//2nd method
            //whenever user is signed in signed out id token changes and whenever
            //we update our password and username this will called

            stream: FirebaseAuth.instance.authStateChanges(),
            //3rd and most simple method whenever login signup happens

            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return const ResponsiveLayout(
                    mobileScreenLayout: AppScreenLayout(),
                    webScreenLayout: WebScreenLayout(),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('${snapshot.error}'));
                }
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                );
              }
              return const LoginScreen();
            }),
      ),
    );
  }
}
