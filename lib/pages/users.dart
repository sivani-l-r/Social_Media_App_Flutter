import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:social_media_app/components/drawer.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text('U S E R S'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      drawer: DrawerWidget(),
      body: StreamBuilder(
        stream: FirebaseFirestore
        .instance
        .collection("Users")
        .snapshots(),
        builder: (context, snapshot) {
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
            final users = snapshot.data!.docs;

            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];

                return ListTile(
                  title: Text(user['username']),
                  subtitle: Text(user['email']),
                );
              },
            );
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