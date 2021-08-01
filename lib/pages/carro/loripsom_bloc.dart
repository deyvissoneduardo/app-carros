import 'dart:async';

import 'package:app_carros/data/loripson.dart';

class LoripsomBloc {
  static String? lorin;
  final _streamController = StreamController<String>();
  Stream<String> get stream => _streamController.stream;

  fetch() async {
    String s = lorin ?? await Loripson.getLoripsom();
    lorin = s;
    _streamController.add(s);
  }

  void dispose() {
    _streamController.close();
  }
}
