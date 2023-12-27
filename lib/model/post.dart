import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String postId;
  final String username;
  final  datePublished;
  final String postUrl;
  final String profImage;
  final likes;
  const Post({
    required this.datePublished,
    required this.description,
    required this.likes,
    required this.postId,
    required this.postUrl,
    required this.uid,
    required this.username,
    required this.profImage,
  });


  //method
  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'description':description,
        'postId':postId,
        'datePublished':datePublished,
        'profImage':profImage,
        'likes':likes,
        'photoUrl':postUrl
      };

    //take snapshot and convert it to user model
    static Post fromSnap(DocumentSnapshot snap){
      var snapshot= snap.data() as Map<String, dynamic>;
      return Post(
        username: snapshot['username'],
        uid: snapshot['uid'],
       description : snapshot['description'],
        postUrl: snapshot['postUrl'],
        datePublished: snapshot['datePublished'],
        likes: snapshot['likes'],
        postId: snapshot['postId'],
        profImage: snapshot['profImage'],
      );
    }
}
