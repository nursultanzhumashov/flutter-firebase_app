import 'package:firebase_full_app/app/data/repo/database_repo.dart';
import 'package:firebase_full_app/app/logic/image_cubit.dart';
import 'package:firebase_full_app/app/logic/image_state.dart';
import 'package:firebase_full_app/app/screens/autImage/page/profile_page2.dart';
import 'package:firebase_full_app/app/screens/autImage/widget/app_bottom_sheet.dart';
import 'package:firebase_full_app/app/screens/autImage/widget/clip_rrect_container.dart';
import 'package:firebase_full_app/app/screens/autImage/widget/custom_widget.dart';
import 'package:firebase_full_app/app/data/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => ImageCubit(),
      child: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final database = DatabaseRepository();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 32,
        title: const Text('Профилди оңдоо'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 42),
          Stack(
            children: <Widget>[
              Center(
                child: BlocBuilder<ImageBloc, ImageState>(
                    builder: (context, state) {
                      if (state is ImageLoading) {
                        return  Center(
                            child: CircularProgressIndicator(),

                          );
                      }
                      if (state is ImageLoaded) {
                        var imagesCount = state.imageUrls.length;
                        return (imagesCount > 0)
                        ?
                        ClipRRectContainer(imageUrl: state.imageUrls[0],)
                        :ClipRRectContainer();
                      }
                      else {
                      return const Text('');
                      
                      }
                      
                    },
                  ),
              ),
              Positioned(
                top: 55,
                // right: 0,
                left: 200,
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0),
                        ),
                      ),
                      builder: (builder) => AppBottomSheet(
                        camera: () async =>
                            context.read<ImageCubit>().imgFromCamera(),
                        gallery: () async =>
                            context.read<ImageCubit>().imgFromGallery(),
                        deletPhoto: () async =>
                            context.read<ImageCubit>().uploadFile,
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xff3473E6),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 62),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfilePage2()),
                  );
                },
                child: Title(color: Colors.black, child: const Text('Image Bloc'))),
          ),
         
        ],
      ),
    );
  }
}