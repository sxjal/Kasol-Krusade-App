import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> _bookings = [];

  @override
  void initState() {
    super.initState();
    _fetchBookings();
  }

  void _fetchBookings() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('bookings').get();
      setState(() {
        _bookings = querySnapshot.docs
            .map((doc) => doc.data())
            .toList()
            .cast<Map<String, dynamic>>();
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _bookings.isEmpty
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: _bookings.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_bookings[index]['name']),
                    subtitle: Text(_bookings[index]['email']),
                  );
                },
              ),
      ),
    );
  }
}
