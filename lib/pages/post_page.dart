import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:neighborhood/util/firebase.dart';
import 'package:neighborhood/util/location.dart';

class PostPage extends StatefulWidget {
  PostPage({Key? key}) : super(key: key);
  final titleTextController = TextEditingController();
  final contentTextController = TextEditingController();

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '投稿画面',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: widget.titleTextController,
                maxLength: 64,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "タイトル",
                    hintText: "タイトルを入力して下さい"),
              ),
              TextField(
                controller: widget.contentTextController,
                maxLines: null,
                maxLength: 250,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '投稿内容',
                  hintText: '投稿内容を入力して下さい。改行で複数行入力可',
                  alignLabelWithHint: true,
                  filled: true,
                ),
              ),
              // TextFormField(
              //   maxLines: null,
              //   maxLength: 250,
              //   style: TextStyle(height: 20),
              //   decoration: InputDecoration(
              //       alignLabelWithHint: true,
              //       border: OutlineInputBorder(),
              //       filled: true,
              //       labelText: "投稿内容",
              //       hintText: "投稿内容を入力して下さい"),
              // ),
              Row(
                children: [
                  // Expanded(
                  //   child: SizedBox(),
                  // ),
                  IconButton(
                    onPressed: () {
                      print('onPressed!');
                      Future<Position> _pos = Pos.getPosition();
                      FireStore.addPost(widget.titleTextController.text,
                          widget.contentTextController.text);
                      // Future<Position> position = Pos.getPosition();
                      // if (widget.titleTextController.text.isEmpty == true ||
                      // widget.contentTextController.text.isEmpty == true) {
                      //   return;
                      // } else if {(
                      // FireStore.addPost();
                      // )}
                    },
                    icon: const Icon(
                      Icons.send,
                    ),
                    color: Colors.blue,
                  ),
                  Text('送信', style: TextStyle(color: Colors.blue)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}