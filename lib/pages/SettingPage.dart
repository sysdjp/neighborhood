import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  static const switch_default_value = false;
  static const switch_key = "test_switch";

  late SharedPreferences _prefs;
//  bool _switchValue = false;
  bool _switchValue = switch_default_value;

  @override
  void initState() {
    _initPreferences();
    super.initState();
  }

  void _initPreferences() {
    SharedPreferences.getInstance().then((value) {
      _prefs = value;

      setState(() {
        _switchValue = _prefs.getBool(switch_key) ?? switch_default_value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('設定画面'),
      ),
      body: Column(
        children: <Widget>[
          Switch(
            onChanged: switchChanged,
            value: _switchValue,
          ),
        ],
      ),
    );
  }

  void switchChanged(bool value) {
    _prefs.setBool(switch_key, value);
  }
}
