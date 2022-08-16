import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_full_app/app/data/model/model.dart';
import 'package:firebase_full_app/app/logic/image_cubit.dart';
import 'package:image_picker/image_picker.dart';

abstract class BaseDatabaseRepository {
  Stream<User> getUser();
  Future<void> updateuserPictures(String imageName);
}

class DatabaseRepository extends BaseDatabaseRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

 
@override
Stream<User> getUser() {
  return _firebaseFirestore
      .collection('users')
      .doc()
      .snapshots()
      .map((snap) => User.fromSnapshot(snap));
}

@override
Future<void> updateuserPictures(String imageName) async {
  String downloadUrl = await ImageCubit().getDownloadURL(imageName);

  return _firebaseFirestore
      .collection('users')
      .doc()
      .update({
    'imageUrl': FieldValue.arrayUnion([downloadUrl])
  });
}
}

abstract class BaseStorageRepo {
  Future<void> uploadFile(XFile image);
  Future<String> getDownloadURL(String imageName);
}

// @override
  // Stream<User> getUser() {
  //   return _firebaseFirestore
  //       .collection('users')
  //       .doc('hoS8TpX7KURlByLh7Fuv')
  //       .snapshots()
  //       .map((snap) => User.fromSnapshot(snap));
  // }

  // @override
  // Future<Future<DocumentReference<Map<String, dynamic>>>> updateuserPictures(String imageName) async {
  //   String downloadUrl = await ImageCubit().getDownloadURL(imageName);
  //   print('Firestore$downloadUrl');
  //   return _firebaseFirestore
  //       .collection('users')
  //       .add({
  //     'imageUrl': downloadUrl
  //   });

 

//   }
// }