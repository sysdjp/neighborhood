import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('Ver0.0.1', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('初版作成'),
          ]
        ),
    );
  }
}
