import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modern/components/for_Prof.dart';
import 'package:modern/components/navbar.dart';
import 'package:modern/components/text_prof.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // current user logged in
  final User? currentUser = FirebaseAuth.instance.currentUser;

  //
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser!.email)
        .get();
  }

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController adresscontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
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
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          future: getUserDetails(),
          builder: (context, Snapshot) {
            if (Snapshot.connectionState == ConnectionState.waiting) {
              //loading
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (Snapshot.data == Null) {
              return const Text("no data");
            }
            //error
            else if (Snapshot.hasError) {
              return Text("Error: ${Snapshot.error}");
            }
            //data received
            else if (Snapshot.hasData) {
              //extract data
              Map<String, dynamic>? user = Snapshot.data!.data();
              return Form(
                // children: [Text(user!['email']), Text(user['username'])],
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const TextProf(dd: 'Full Name'),
                      MyProfTxt(
                        controller: TextEditingController(
                            text:  user!['username'] ),
                        hintText: 'enter your first name',
                        iconProf: const Icon(Icons.perm_identity),
                      ),
                      const TextProf(dd: 'Your Date Of Birth'),
                      MyProfTxt(
                          controller: datecontroller,
                          hintText: '01/01/2002',
                          iconProf: const Icon(Icons.calendar_month)),
                      const TextProf(dd: 'Number'),
                      MyProfTxt(
                          controller: TextEditingController(text:  user['number']),
                          hintText: '0999999999',
                          iconProf: const Icon(Icons.phone)),
                      const TextProf(dd: 'One of your relative number'),
                      MyProfTxt(
                          controller: emailcontroller,
                          hintText: '09999999999',
                          iconProf: const Icon(Icons.phone)),
                      const TextProf(dd:'Email'),
                      MyProfTxt(
                        
                          controller: TextEditingController(
                            text:  user['email'] ),
                            
                          hintText: 'Example@gmail.com',
                          iconProf: const Icon(Icons.email)),
                      const TextProf(dd: 'Date of birth'),
                      MyProfTxt(
                          controller: TextEditingController(text:  user['DOB']),
                          hintText: '01/01/2002',
                          iconProf: const Icon(Icons.calendar_month)),
                      const TextProf(dd: 'Adress'),
                      MyProfTxt(
                          controller: TextEditingController(text: user['DOB']),
                          hintText: 'Syria-Damascus-Jaramana-Alhomsi street',
                          iconProf: const Icon(Icons.location_city)),
                      const TextProf(dd: 'Your ID number'),
                      MyProfTxt(
                          controller: datecontroller,
                          hintText: '040154353434',
                          iconProf: const Icon(Icons.info_outlined)),
                    ],
                  ),
                ),
              );
            } else {
              return const Text('no data');
            }
          }),
    );
  }
}
