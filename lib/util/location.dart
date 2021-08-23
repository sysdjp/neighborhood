import 'package:geolocator/geolocator.dart';

class Pos {
  static Future<Position> getPosition() async {
    // 現在の位置を返す
    Position _position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    // // 北緯がプラス。南緯がマイナス
    // print("緯度: " + _position.latitude.toString());
    // // 東経がプラス、西経がマイナス
    // print("経度: " + _position.longitude.toString());
    // // 高度
    // print("高度: " + _position.altitude.toString());
    // // 距離をメートルで返す
    double distanceInMeters =
    Geolocator.distanceBetween(35.68, 139.76, -23.61, -46.40);
    print(distanceInMeters);
    // 方位を返す
    double bearing = Geolocator.bearingBetween(35.68, 139.76, -23.61, -46.40);
    print(bearing);
    return _position;
  }
}