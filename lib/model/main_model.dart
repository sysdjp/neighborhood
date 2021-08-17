import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:neighborhood/init_page.dart';

class MainModel extends ChangeNotifier {
  List<InitPage> initList = [];
  String newTodoText = '';

  Future getTodoList() async {
    final snapshot =
      await FirebaseFirestore.instance.collection('ver').get();
    final docs = snapshot.docs;
    final initList = docs.map((doc) => InitPage(doc)).toList();
    this.initList = initList;
    notifyListeners();
  }

  void getTodoListRealtime() {
    final snapshots =
    FirebaseFirestore.instance.collection('todoList').snapshots();
    snapshots.listen((snapshot) {
      final docs = snapshot.docs;
      final initList = docs.map((doc) => InitPage(doc)).toList();
      this.initList = initList;
      notifyListeners();
    });
  }

  Future add() async {
    final collection = FirebaseFirestore.instance.collection('todoList');
    await collection.add({
      'title': newTodoText,
      'createdAt': Timestamp.now(),
    });
  }

  void reload() {
    notifyListeners();
  }
}
