import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              await _auth.signOut();
              Navigator.of(context)
                  .pop(); // Navigate back to the previous screen
            } catch (e) {
              print(e);
            }
          },
          child: const Text("Logout"),
        ),
      ),
    );
  }
}
