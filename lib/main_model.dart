import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  String name = "rei";

  void changeName() {
    name = "riku";
    notifyListeners();
  }
}
