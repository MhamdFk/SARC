import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modern/helper/helper_function.dart';

class UserPage extends StatelessWidget {
   UserPage({super.key});

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
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("users").snapshots(),
          builder: (context, snapshot) {
            // any error
            if (snapshot.hasError) {
              displayMessageToUser("something went wrong", context);
            }
            //show loading circle
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data == Null) {
              return const Text("no data");
            }
            //get all users
            final users = snapshot.data!.docs;

            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                // get individual user
                final user = users[index];

                return ListTile(
                  title: Text(user['username']),
                  subtitle: Text(user['email']),
                );
              },
            );
          }),
    );
  }
}
