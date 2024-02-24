
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:social_media_app/components/drawer.dart';
import 'package:social_media_app/database/firestore.dart';

class LikesPage extends StatelessWidget {
  LikesPage({Key? key});

  final FirestoreDB database = FirestoreDB();
  final User? currentUser = FirebaseAuth.instance.currentUser;

  Future<String> getUserEmail() async {
  if (currentUser != null) {
    try {
      DocumentSnapshot<Map<String, dynamic>> userData =
          await FirebaseFirestore.instance
              .collection("Users")
              .doc(currentUser!.email)
              .get();

      Map<String, dynamic>? user = userData.data();

      if (user != null) {
        return user['email'] ?? '';
      } else {
        return ''; 
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return ''; 
    }
  } else {
    return ''; 
  }
}

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text('L I K E S'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      drawer: DrawerWidget(),
      body: FutureBuilder<String>(
        future: getUserEmail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Lottie.network(
                  'https://lottie.host/7771e78d-39dc-40f9-b271-9c75d264d0e8/bgSKwTFkza.json'),
            );
          }

          final userEmail = snapshot.data ?? '';

          return StreamBuilder(
            stream: database.getLikeStream(userEmail),
            builder: (context, snapshot) {

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              // final likes = snapshot.data?.docs ?? [];
               
              final likes = snapshot.data!.docs;

              if (snapshot.data == null || likes.isEmpty) 
              { 
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Text("No likes."),
                  ),
                );
              }

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: likes.length,
                itemBuilder: (context, index) {

                  final like = likes[index];

                  String posterMessage = like['PosterMessage'];
                  String posterEmail = like['PosterEmail'];

                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Card(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.5),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              posterMessage,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "$posterEmail",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inversePrimary
                                            .withOpacity(0.4),
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.favorite_outline),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
