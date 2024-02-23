import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  void logoutUser()
  {
    FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              SizedBox(height: 60,),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: ListTile(
                  leading: Icon(Icons.person_2_rounded),
                  title: Text("P R O F I L E"),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text("L I K E S"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: ListTile(
                  leading: Icon(Icons.group),
                  title: Text("U S E R S"),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: ListTile(
              leading: Icon(Icons.logout_rounded),
              title: Text("L O G O U T"),
              onTap: () {
                Navigator.pop(context);
                logoutUser();
            
              },
            ),
          ),
        ],
      ),

    );
  }
}