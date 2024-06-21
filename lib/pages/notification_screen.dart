import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modern/Services/fire_store.dart';

class MessageScreen extends StatefulWidget {
  final String title;
  final String body;
  final String email;
  const MessageScreen({super.key, required this.title, required this.body, required this.email});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  final FireStoreService fireStoreService = FireStoreService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 234, 27, 34),
        toolbarHeight: 115,
        title: ClipOval(
          child: Container(
            color: Colors.white,
            child: SizedBox(
              child: Image.asset(
                'images/sarc.png',
                height: 100,
              ),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10), // تحديد شكل الحواف هنا
          border: Border.all(
            // إضافة حواف
            color: Colors.black, // لون الحواف
            width: 2, // عرض الحواف
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            Text(widget.body),
            SizedBox(height: 16),
            Text(widget.email),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.check,
                      color: const Color.fromARGB(255, 3, 187, 9)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/maps');
                    // Handle true button press
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: const Color.fromARGB(255, 234, 27, 34),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Handle false button press
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
