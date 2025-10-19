import 'package:flutter/widgets.dart';

class PinInputProvider with ChangeNotifier {
  String currentPin = '';

  void onNumberTap(String number) {
    if (currentPin.length < 4) {
      currentPin += number;
      notifyListeners();
    }
  }

  void onDelate() {
    if (currentPin.isNotEmpty) {
      currentPin = currentPin.substring(0, currentPin.length - 1);
      notifyListeners();
    }
  }
}
