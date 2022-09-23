import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_full_app/app/data/repo/database_repo.dart';
import 'package:firebase_full_app/app/logic/image_cubit.dart';
import 'package:firebase_full_app/app/logic/image_event.dart';
import 'package:firebase_full_app/app/logic/image_state.dart';
import 'package:firebase_full_app/app/screens/aut/authentication_screen.dart';
import 'package:firebase_full_app/app/screens/home_page.dart';
import 'package:firebase_full_app/app/data/model/model.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        
        BlocProvider(
          create: (_) => ImageBloc(databaseRepository: DatabaseRepository(),
          )..add(LoadImag(),),
        ),
      ],
     
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  const MainPage(),
       
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomePage();
            } else {
              return const AuthenticationScreen(); //LoginWidget
            }
          },
        ),
      );
}
