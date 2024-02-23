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

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Card(
                    elevation: 4.0,
                    color:  Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(34),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16.0),
                      title: Text(
                        user['username'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      subtitle: Text(
                        user['email'],
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.person_add_alt,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        onPressed: () {
                          // Add functionality for more options
                        },
                      ),
                      onTap: () {
                        // Add functionality for tapping on the list tile
                      },
                    ),
                  ),
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