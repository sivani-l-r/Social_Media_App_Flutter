import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/auth/auth.dart';
import 'package:social_media_app/firebase_options.dart';
import 'package:social_media_app/pages/likes.dart';
import 'package:social_media_app/pages/login.dart';
import 'package:social_media_app/pages/mainscreen.dart';
import 'package:social_media_app/pages/profile.dart';
import 'package:social_media_app/pages/signup.dart';
import 'package:social_media_app/pages/start.dart';
import 'package:social_media_app/pages/users.dart';
import 'package:social_media_app/themes/darkmode.dart';
import 'package:social_media_app/themes/lightmode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
      theme: lightMode,
      darkTheme: darkMode,
      routes: {
        '/start_page':(context) => StartPage(),
        '/login_page':(context) => LoginPage(),
        '/signup_page':(context) => SignUpPage(),
        '/home':(context) => MainPage(),
        '/profile':(context) => ProfilePage(),
        '/users':(context) => UsersPage(),
        '/likes':(context) => LikesPage(),


      },
    );
  }
}

