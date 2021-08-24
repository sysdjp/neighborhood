import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  List postList = [];

  // List postList = FireStore.getPost() as List;

  ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('検索結果一覧')),
        body: StreamBuilder<QuerySnapshot>(
            stream: db.collection('post').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else
                return ListView(
                  children: snapshot.data!.docs.map((doc) {
                    return Card(
                      child: ListTile(
                          title:
                          Text(
                            // 'title',
                               doc['title'],
                          ),
                          subtitle: Text('content')),
                    );
                  }).toList(),
                );
            }));
  }

// テキストにサブタイトルをつけて四角で囲って一覧表示
// https://moimoiblog.com/programing/various-listview/
  Widget _buildButtonsTileView(String title) {
    return Card(
        child: ListTile(
          title: Text(title),
          subtitle: Text("サブタイトル"),
        ));
  }
}
