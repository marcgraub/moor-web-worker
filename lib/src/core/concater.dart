import 'package:dorker/dorker.dart';

class Concater {
  dynamic _memory = '';
  Concater(Dorker _boss) {
    _boss.onMessage.listen((dynamic data) {
      _memory = data;
//      _memory += '$data ';

      _boss.postMessage.add(_memory);
    });
  }
}