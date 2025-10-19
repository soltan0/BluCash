import 'package:flutter/widgets.dart';
import 'package:hive_flutter/adapters.dart';

class PinPutProvider with ChangeNotifier {
  final _box = Hive.box('settings');

  String? _pin1;
  String? _pin2;

  bool isConfirmStep = false;

  void setPin1(String pin) {
    _pin1 = pin;
  }

  void setPin2(String pin) {
    _pin2 = pin;
    checkPin();
  }

  void  checkPin() {
    if (_pin1 == _pin2) {
      _box.put('user_pin', _pin1);
      isConfirmStep = true;
      notifyListeners();
    } else {
      isConfirmStep = false;
      notifyListeners();
    }
  }

  String getPin() {
    return _box.get('user_pin');
  }

    //  Получить сохранённый PIN 
  String? getSavedPin() => _box.get('user_pin');



  // === Очистить PIN (например, при сбросе) ===
  void clearPin() {
    _pin1 = null;
    _pin2 = null;
    isConfirmStep = false;
    _box.delete('user_pin');
    notifyListeners();
  }

}
