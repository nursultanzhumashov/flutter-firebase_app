import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationWidget extends StatefulWidget {
  const AuthenticationWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AuthenticationWidgetState createState() => _AuthenticationWidgetState();
}

class _AuthenticationWidgetState extends State<AuthenticationWidget> {
  final emailContoller = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailContoller.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Авторизация',
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: emailContoller,
            decoration: InputDecoration(
              hintText: 'Введите email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            cursorColor: Colors.red,
            controller: passwordController,
            decoration: InputDecoration(
              hintText: 'Введите пароль',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: 335,
            height: 56,
            child: ElevatedButton(
              onPressed: signIn,
              // ignore: sort_child_properties_last
              child: const Text('Войти'),
              style: ElevatedButton.styleFrom(primary: const Color(0xff0C40A6)),
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          SizedBox(
            width: 325,
            height: 56,
            child: ElevatedButton(
              onPressed: signUp,
              // ignore: sort_child_properties_last
              child: const Text('Регистрация'),
              style: ElevatedButton.styleFrom(primary: const Color(0xff0C40A6)),
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          SizedBox(
            width: 335,
            height: 56,
            child: ElevatedButton(
              onPressed: signInAnonymously,
              // ignore: sort_child_properties_last
              child: const Text('Anonym'),
              style: ElevatedButton.styleFrom(primary: const Color(0xff0C40A6)),
            ),
          ),
          const SizedBox(
            height: 17,
          ),
        ]),
      );

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailContoller.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // ignore: avoid_print
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        // ignore: avoid_print
        print('The account already exists for that email.');
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailContoller.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // ignore: avoid_print
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        // ignore: avoid_print
        print('The account already exists for that email.');
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future signInAnonymously() async {
    await FirebaseAuth.instance.signInAnonymously();
  }
}
