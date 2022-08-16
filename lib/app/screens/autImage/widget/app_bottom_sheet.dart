import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({
    super.key,
    required this.gallery,
    required this.camera,
    required this.deletPhoto,
  });
  final Function gallery;
  final Function camera;
  final Function deletPhoto;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 225,
      width: 375,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 22),
          Row(
            children: const [
              SizedBox(width: 20),
              Text(
                "Изменить фото",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          const SizedBox(height: 22),
          Row(
            children: <Widget>[
              const SizedBox(width: 10),
              TextButton(
                onPressed: () async {
                  camera();

                  Navigator.pop(context);
                },
                child: SvgPicture.asset('assets/camera_icon.svg'),
              ),
              TextButton(
                  onPressed: () async {
                    gallery();

                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset('assets/gallery_icon.svg')),
              Column(
                children: [
                  const SizedBox(height: 15),
                  TextButton(
                    onPressed: () async {
                      deletPhoto();

                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset('assets/delete_photo_icon.svg'),
                  ),
                ],
              ),
              // space.sizedW20,
            ],
          ),
        ],
      ),
    );
  }
}
