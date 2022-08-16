// ignore: depend_on_referenced_packages
import 'dart:async';
import 'dart:io';

// ignore: depend_on_referenced_packages
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_full_app/app/data/repo/database_repo.dart';
import 'package:firebase_full_app/app/logic/image_event.dart';
import 'package:firebase_full_app/app/logic/image_state.dart';
import 'package:firebase_full_app/app/data/model/model.dart';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';

class ImageCubit extends Cubit<ImageState1> {
  ImageCubit() : super(ImageState1());
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  final ImagePicker _picker = ImagePicker();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // _photo = File(pickedFile.path);
      emit(ImageState1(photo: File(pickedFile.path)));
      uploadFile();
    } else {
      print('No image selected.');
    }
  }

  Future imgFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      emit(ImageState1(photo: File(pickedFile.path)));
      uploadFile();
    } else {
      print('No image selected.');
    }
  }

  Future uploadFile() async {
    if (state.photo == null) return;
    final fileName = basename(state.photo!.path);
    final destination = 'user_1/$fileName';

    try {
      final ref = firebase_storage.FirebaseStorage.instance.ref(destination);

      await ref
          .putFile(
            File(state.photo!.path),
          )
          .then(
            (p0) => DatabaseRepository().updateuserPictures(destination),
          );
      emit(ImageState1(photo: File(state.photo!.path)));
      getDownloadURL(destination);
    } catch (e) {
      print('error occured');
    }
  }

  Future<String> getDownloadURL(
    String imageName,
  ) async {
    String downloadUrl = await storage.ref(imageName).getDownloadURL();
    emit(ImageState1(imageUrl: downloadUrl));

    print('imageUrl nursultan  $downloadUrl');
    // DatabaseRepository().updateuserPictures(imageName);
    return downloadUrl;
  }
  
}

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final DatabaseRepository _databaseRepository;
  StreamSubscription? _databaseSubscription;
  ImageBloc({required DatabaseRepository databaseRepository})
      : _databaseRepository = databaseRepository,
        super(ImageLoading());

  @override
  Stream<ImageState> mapEventToState(ImageEvent event) async* {
    if (event is LoadImag) {
      yield* _mapLoadImageToState();
    }
    if (event is UpdedeImage) {
      yield* _mapUpdateImageToState(event);
    }
  }

  Stream<ImageState> _mapLoadImageToState() async* {
    _databaseSubscription?.cancel();

    _databaseRepository.getUser().listen(
          (user) => add(
            UpdedeImage(user.imageUrls),
          ),
        );
  }

  Stream<ImageState> _mapUpdateImageToState(UpdedeImage event) async* {
    yield ImageLoaded(imageUrls: event.imageUrls);
  }
}
