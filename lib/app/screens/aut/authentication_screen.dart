import 'package:firebase_full_app/app/screens/autImage/page/profile_page.dart';
import 'package:firebase_full_app/app/screens/suggestion/suggestion.dart';
import 'package:firebase_full_app/app/widgets/authentication_widget.dart';
import 'package:flutter/material.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(3),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://picsum.photos/200/300',
                    height: 112,
                    width: 120,
                  ),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Сделай жизнь проще',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const AuthenticationWidget(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage2()),
                    );
                  },
                  child: Title(
                    color: Colors.red,
                    child: const Text('Camera,gallery '),
                  ),
                ),
                const SizedBox(height: 10),
                 ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  SuggestionPage()),
                    );
                  },
                  child: Title(
                    color: Colors.red,
                    child: const Text('Suggestion'),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
