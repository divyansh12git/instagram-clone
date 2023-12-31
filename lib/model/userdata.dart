import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String bio;
  final List followers;
  final List following;
  const User({
    required this.email,
    required this.bio,
    required this.followers,
    required this.following,
    required this.photoUrl,
    required this.uid,
    required this.username,
  });


  //method
  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'email': email,
        'bio': bio,
        'followers': [],
        'following': [],
        'photoUrl': photoUrl,
      };

    //take snapshot and convert it to user model
    static User fromSnap(DocumentSnapshot snap){
      var snapshot= snap.data() as Map<String, dynamic>;
      return User(
        username: snapshot['username'],
        uid: snapshot['uid'],
        email: snapshot['email'],
        photoUrl: snapshot['photoUrl'],
        bio: snapshot['bio'],
        followers: snapshot['followers'],
        following: snapshot['following'],
      );
    }
}
