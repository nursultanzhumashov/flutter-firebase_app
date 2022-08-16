// part of 'image_cubit.dart';

import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

abstract class ImageState extends Equatable {
  const ImageState();

  @override
  List<Object> get props => [];
}

class ImageLoading extends ImageState {}

class ImageLoaded extends ImageState {
  final List<dynamic> imageUrls;
  const ImageLoaded( {this.imageUrls = const []});

  @override
  List<Object> get props => [imageUrls];
  
}

class ImageState1 extends Equatable {
  const ImageState1({this.photo, this.imageUrl});
  final File? photo;
  final String? imageUrl;

  @override
  List<Object?> get props => [photo];

  List<Object?> get props2 => [imageUrl];
}
