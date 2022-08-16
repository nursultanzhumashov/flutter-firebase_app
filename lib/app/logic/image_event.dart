import 'package:equatable/equatable.dart';

abstract class ImageEvent extends Equatable {
  const ImageEvent();

  @override
  List<Object> get props => [];
}

class LoadImag extends ImageEvent {}

class UpdedeImage extends ImageEvent {
  final List<dynamic> imageUrls;
  const UpdedeImage(this.imageUrls);

  @override
  List<Object> get props => [imageUrls];
}
