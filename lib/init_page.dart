import 'package:cloud_firestore/cloud_firestore.dart';

class InitPage {

  String? initpage;
  DocumentReference? documentReference;

  InitPage(DocumentSnapshot doc) {
    this.documentReference = doc.reference;

    final data = doc.data() as Map<String, Object>;

    this.initpage = data['initpage'].toString();

  }
}