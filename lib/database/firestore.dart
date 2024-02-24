

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreDB 
{
  User? user = FirebaseAuth.instance.currentUser;
  final CollectionReference posts = 
                FirebaseFirestore.instance.collection('Posts');
  final CollectionReference likes = 
                FirebaseFirestore.instance.collection('Likes');
  Future<void> addPost(String message)
  {
    return posts.add(
      {
        'UserEmail': user!.email,
        'PostMessage': message,
        'TimeStamp': Timestamp.now(),
      }
    );
  }

  Stream<QuerySnapshot> getPostStream()
  {
      final postStream = FirebaseFirestore
      .instance
      .collection('Posts')
      .orderBy('TimeStamp', descending: true)
      .snapshots();

      return postStream;
  }

Future<void> addPostToLikes(String postId) async {
  DocumentSnapshot postSnapshot = await posts.doc(postId).get();
  Map<String, dynamic>? postData = postSnapshot.data() as Map<String, dynamic>?;

  if (postData != null) {
    String? posterEmail = postData['UserEmail'];
    String? posterMessage = postData['PostMessage'];
    return likes.doc(postId).set({
      'UserEmail': user!.email,
      'PosterEmail': posterEmail, 
      'TimeStamp': Timestamp.now(),
      'PosterMessage': posterMessage,
    });
  } else {
    throw Exception('Post data not found for postId: $postId');
  }
}

Stream<QuerySnapshot> getLikeStream(String email) {
  final likeStream = FirebaseFirestore.instance
      .collection('Likes')
      .where('UserEmail', isEqualTo: email) // Filter by user email
      .orderBy('TimeStamp', descending: true)
      .snapshots();

  return likeStream;
}



  
}