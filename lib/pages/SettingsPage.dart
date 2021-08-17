import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPages extends StatefulWidget {
  const SettingPages({Key? key}) : super(key: key);

  @override
  _SettingPagesState createState() => _SettingPagesState();
}

class _SettingPagesState extends State<SettingPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('設定'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(Icons.person),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Account',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
