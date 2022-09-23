import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
 

  final List<dynamic> imageUrls;
  const User({
    required this.imageUrls,
  });

  @override
  List<Object> get props => [imageUrls,];
  static User fromSnapshot(DocumentSnapshot snap) {
    User user = User(
      imageUrls: snap['imageUrl'],
    );
    return user;
  }
}



 