import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:neighborhood/util/location.dart';

class FireStore {

  late final String title;
  late final String content;
  late final Position _pos;

  static FirebaseFirestore _firestoreinstannce = FirebaseFirestore.instance;

  static Future<void> addPost(String title,String content) async {
    Position _pos = await Pos.getPosition();

    final postRef = await _firestoreinstannce.collection('post').add({
      'title' : title,
      'content' : content,
      'keido' : _pos.longitude.toString(),
      'ido' : _pos.latitude.toString(),
      'reply' : '1',
      'chat' : '1',
      'uid' : '123456789',
      'createdAt' : DateTime.now(),
    });
  }
}