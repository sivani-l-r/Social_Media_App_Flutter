import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:social_media_app/components/drawer.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  User? currentUser = FirebaseAuth.instance.currentUser;

  Future<DocumentSnapshot<Map<String,dynamic>>> getUserData() async
  {
      return await FirebaseFirestore.instance
      .collection("Users")
      .doc(currentUser!.email)
      .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text('P R O F I L E'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      drawer: DrawerWidget(),
      body: FutureBuilder<DocumentSnapshot<Map<String,dynamic>>>(
        future: getUserData(),
        builder:(context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting)
          {
            return Center(
            child: Lottie.network('https://lottie.host/7771e78d-39dc-40f9-b271-9c75d264d0e8/bgSKwTFkza.json')
            );
          }
          else if(snapshot.hasError)
          {
            return Text("Error: ${snapshot.error}");
          }
          else if(snapshot.hasData)
          {
            Map<String, dynamic>? user = snapshot.data!.data();

            return ProfilePageDetails(email: user!['email'], username: user['username']);
          }
          else
          {
            return Text('No Data');
          }
          
        },
      ),
    );
  }
}

class ProfilePageDetails extends StatelessWidget {
  final String email;
  final String username;

  const ProfilePageDetails({
    Key? key,
    required this.email,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                'Username',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              subtitle: Text(
                username,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Divider(), // Adding a divider for visual separation
            ListTile(
              title: Text(
                'Email',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              subtitle: Text(
                email,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}