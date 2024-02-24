import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:social_media_app/components/drawer.dart';
import 'package:intl/intl.dart';
import 'package:social_media_app/database/firestore.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final FirestoreDB database = FirestoreDB();
  final TextEditingController newPostControl = TextEditingController();

  void postMessage()
  {
    if(newPostControl.text.isNotEmpty)
    {
        String message = newPostControl.text;
        database.addPost(message);
        newPostControl.clear();
        
    }
    
  }

  void likeMessage(String postId) {
  database.addPostToLikes(postId);
  }


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      drawer: DrawerWidget(),
      body: Column(
        children: [
          Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: newPostControl,
              decoration: InputDecoration(
                hintText: 'Share your thoughts...',
                filled: true,
                fillColor: Theme.of(context).colorScheme.primary,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,

                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                suffix: IconButton(
                onPressed: () {
                    postMessage();
                }, 
                icon: Icon(Icons.edit_rounded),
                )
                
              ),
              maxLines: 4,
              minLines: null,
              
            ),
          ),
        ),

        StreamBuilder(
          stream: database.getPostStream(), 
          builder:(context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting)
                  {
                    return Center(
                    child: Lottie.network('https://lottie.host/7771e78d-39dc-40f9-b271-9c75d264d0e8/bgSKwTFkza.json')
                    );
                  }

                final posts = snapshot.data!.docs;

                if(snapshot.data == null || posts.isEmpty)
                {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(25),
                      child: Text("No posts.. share something!"),
                    ),
                  );
                }

                return Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, 
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          final post = posts[index];

                          String message = post['PostMessage'];
                          String userEmail = post['UserEmail'];
                          Timestamp timestamp = post['TimeStamp'];
                          String formattedDate = DateFormat('yyyy-MM-dd').format(timestamp.toDate());

                          return Padding(
                            padding: const EdgeInsets.all(20),
                            child: Card(
                              color:  Theme.of(context).colorScheme.secondary.withOpacity(0.5),
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
                                      message,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).colorScheme.inversePrimary,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "$userEmail",
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.4),
                                                
                                              ),
                                            ),
                                             SizedBox(height: 4),
                                            Text(
                                              "$formattedDate",
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.4),
                                              ),
                                            ),
                                          ],
                                        ),
                                        IconButton(
                                        onPressed: () {
                                          likeMessage(post.id); // Assuming 'post' has an 'id' field
                                        }, 
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
                      ),
                    );                
                  
          },)

        ],
      ),

    );
  }
}


