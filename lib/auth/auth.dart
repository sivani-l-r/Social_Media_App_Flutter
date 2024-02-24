import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/pages/mainscreen.dart';
import 'package:social_media_app/pages/start.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) 
        {
          if(snapshot.hasData)
          {
            return MainPage();
          }
          else{
            return const StartPage();
          }
        },
      ),
    );
  }
}