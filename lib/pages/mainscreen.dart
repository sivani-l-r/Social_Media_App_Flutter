import 'package:flutter/material.dart';
import 'package:social_media_app/components/drawer.dart';
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

        ],
      ),

    );
  }
}

