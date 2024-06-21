

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FireStoreService {
  // get collection of info
  final CollectionReference infos =
      FirebaseFirestore.instance.collection('infos');
  // Create : add new info
  Future<void> addInfo(String info) {
    return infos.add({
      'info': info,
      'timestamp': Timestamp.now(),
    });
  }

  // READ : get Infos from db
  Stream<QuerySnapshot> getInfoStream() {
    final infoStream = infos.orderBy('timestamp', descending: true).snapshots();

    return infoStream;
  }

  Future<void> updateInfo(String docID, String newInfo) {
    return infos
        .doc(docID)
        .update({'note': newInfo, 'timestamp': Timestamp.now()});
  }

  Future<void> deleteInfo(String docID) {
    return infos.doc(docID).delete();
  }
}

class firestoreDatabase {
  // cuurent user logged in
  User? user = FirebaseAuth.instance.currentUser;

// get collection of post from firebase
  final CollectionReference requests =
      FirebaseFirestore.instance.collection('requests');

  // post a message
  Future<void> addrequests(List message , String message2) {
    return requests.add({
      'Useremail': user!.email,
      'case': message,
      'Status': message2,
      'TimeStamp': Timestamp.now()
    });
  }

  //read posts from databasse
  Stream<QuerySnapshot> getRequestsStream() {
    final requestStream = FirebaseFirestore.instance
        .collection('requests')
        .orderBy('TimeStamp', descending: true)
        .snapshots();

    return requestStream;
  }

}
