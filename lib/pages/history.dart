import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modern/Services/fire_store.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});
  final firestoreDatabase database = firestoreDatabase();
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
            stream: database.getRequestsStream(),
            builder: (context, snapshot) {
              // show loading circle
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              //get all posts
              final reuests = snapshot.data!.docs;
              //no data?
              if (snapshot.data == Null || reuests.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Text('no requsts'),
                  ),
                );
              }
              // return as a list
              return  ListView.builder(
                      itemCount: reuests.length,
                      itemBuilder: (context, index) {
                        // get eachinvidual request
                        final request = reuests[index];
                        // getdata fromeach request
                        List message = request['case'];
                        String username = request['Useremail'];
                        String message2 = request['Status'];
                        Timestamp timestamp = request['TimeStamp'];

                        //return as a listtile
                        return ListTile(
                          title: Text(username),
                          subtitle: Text('   ${message2}  ${message}  '),//${message} 
                        );
                      });
            }));
  }
}
