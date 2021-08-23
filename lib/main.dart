import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:neighborhood/pages/SettingPage.dart';
import 'package:neighborhood/pages/info_page.dart';
import 'package:neighborhood/pages/page4.dart';
import 'package:neighborhood/pages/post_page.dart';
import 'package:neighborhood/util/location.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print('after init');
  await Pos.getPosition();
  print('after pos');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TopPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class TopPage extends StatefulWidget {
  const TopPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  int _selectedIndex = 0;
  List<Widget> pageList = [InfoPage(), SettingsPage(), PostPage(), Page4()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: pageList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.info),
              backgroundColor: Colors.grey,
              label: '情報'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              backgroundColor: Colors.grey,
              label: '設定'),
          BottomNavigationBarItem(
              backgroundColor: Colors.grey,
              icon: Icon(Icons.post_add),
              label: '投稿'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              backgroundColor: Colors.grey,
              label: '検索'),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Theme.of(context).disabledColor,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
  }
}
