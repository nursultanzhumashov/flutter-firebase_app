import 'package:firebase_full_app/app/logic/image_cubit.dart';
import 'package:firebase_full_app/app/logic/image_state.dart';
import 'package:firebase_full_app/app/screens/autImage/widget/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage2 extends StatelessWidget {
  const ProfilePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 32,
        title: const Text('бул бет тест учун'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                        return Center(
                          child: Column(children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                (imagesCount > 0)
                          ? CustomWidget(imageUrl: state.imageUrls[0],)
                          : const CustomWidget(),
                                 (imagesCount > 1)
                          ? CustomWidget(imageUrl: state.imageUrls[1],)
                          : const CustomWidget(),
                                 (imagesCount > 2)
                          ? CustomWidget(imageUrl: state.imageUrls[2],)
                          : const CustomWidget(),
                         
                        
                       
                          ],
                          ),
                          Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               (imagesCount > 3)
                          ? CustomWidget(imageUrl: state.imageUrls[3],)
                          : const CustomWidget(),
                                 (imagesCount > 4)
                          ? CustomWidget(imageUrl: state.imageUrls[4],)
                          : const CustomWidget(),
                                 (imagesCount > 5)
                          ? CustomWidget(imageUrl: state.imageUrls[5],)
                          : const CustomWidget(),
                            ],
                          ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               (imagesCount > 6)
                          ? CustomWidget(imageUrl: state.imageUrls[6],)
                          : const CustomWidget(),
                                 (imagesCount > 7)
                          ? CustomWidget(imageUrl: state.imageUrls[7],)
                          : const CustomWidget(),
                                 (imagesCount > 8)
                          ? CustomWidget(imageUrl: state.imageUrls[8],)
                          : const CustomWidget(),
                            ],
                          ),
                             Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               (imagesCount > 9)
                          ? CustomWidget(imageUrl: state.imageUrls[9],)
                          : const CustomWidget(),
                                 (imagesCount > 10)
                          ? CustomWidget(imageUrl: state.imageUrls[10],)
                          : const CustomWidget(),
                                 (imagesCount > 11)
                          ? CustomWidget(imageUrl: state.imageUrls[11],)
                          : const CustomWidget(),
                            ],
                          )
                          
                              ],
                            ),
                          
                          ],
                          ),
                        );
                      }
                      else {return const Text('nursultanju mwads');}
                      
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 62),
          ],
        ),
      ),
    );
  }
}


