import 'package:flutter/material.dart';

class DummyPage extends StatelessWidget {
  const DummyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
        Text('Ver0.0.2', style: TextStyle(fontWeight: FontWeight.bold, )),
        Text('getPostダミー化'),
        Text('Ver0.0.1', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('初版作成'),
      ]),
    );
  }
}