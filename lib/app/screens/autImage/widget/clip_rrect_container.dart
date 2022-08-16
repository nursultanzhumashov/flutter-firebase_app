import 'package:firebase_full_app/app/logic/image_cubit.dart';
import 'package:firebase_full_app/app/logic/image_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClipRRectContainer extends StatelessWidget {
  const ClipRRectContainer({super.key, this.imageUrl});
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(150),
      child: SizedBox.fromSize(
          size: const Size.fromRadius(50),
          child: (imageUrl == null)
              ? BlocBuilder<ImageCubit, ImageState1>(
                  builder: (context, state) {
                   if (state.photo == null) {
                        return SvgPicture.asset('assets/avatar.svg');
                      } else {
                        return CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(state.photo!.path),
                        );
                      }
                   
                  },
                )
              : Image.network(
                  imageUrl!,
                  fit: BoxFit.cover,
                )),
    );
  }
}
