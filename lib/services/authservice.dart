import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kasolkrusade/utils/utils.dart';

class AuthService {
  createUser(data, context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Sign Up Failed"),
              content: Text(e.toString()),
            );
          });
    }
  }

  loginUser(data, context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
      showSnackBar(context, "SignUp successfull");
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Login Error"),
              content: Text(e.toString()),
            );
          });
    }
  }

  logout(context) async {
    try {
      await FirebaseAuth.instance.signOut();
      void showSnackBar(BuildContext context, String message) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      }

      showSnackBar(context, 'Signout Succefull');
      Navigator.pop(context);
    } catch (e) {
      void showSnackBar(BuildContext context, String message) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      }

      showSnackBar(context, e.toString());
    }
  }

  void showSnackBar(context, String s) {}
}
