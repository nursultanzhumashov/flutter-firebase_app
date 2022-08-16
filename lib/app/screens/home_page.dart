import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wish Swish'),
        toolbarHeight: 64,
      ),
      body: Center(
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(35),
          ),
          icon: const Icon(
            Icons.lock_open,
          ),
          label: const Text(
            'Auth',
            style: TextStyle(fontSize: 24),
          ),
          onPressed: sign,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(
                () => currentIndex = index,
              ),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: ''),
          ]),
    );
  }

  Future sign() async {
    await FirebaseAuth.instance.signOut();
  }
}
