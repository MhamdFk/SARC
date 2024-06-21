import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyProfTxt extends StatefulWidget {
  final controller;
  final String hintText;
  final Icon iconProf;
  MyProfTxt({
    super.key,
    //controller = to get what typing the user in fields / hinttext= hint / obscure= hide the password
    required this.controller,
    required this.hintText,
    required this.iconProf,
  });

  //current looged  in user
  final User? currentUser = FirebaseAuth.instance.currentUser;

  // future to fetch user detail
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .get();
  }

  @override
  State<MyProfTxt> createState() => _MyProfTxtState();
}

class _MyProfTxtState extends State<MyProfTxt> {
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  width: 200,
                  child: TextFormField(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                    controller: widget.controller,
                    enabled: isEditing,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.hintText,
                      prefixIcon: widget.iconProf,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(isEditing ? Icons.save : Icons.edit),
                onPressed: () {
                  setState(() {
                    if (isEditing) {
                      // Save button pressed
                      // Perform save operation here
                    }
                    isEditing = !isEditing;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
