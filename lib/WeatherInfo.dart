import 'package:flutter/foundation.dart';

class WeatherInfo with ChangeNotifier {
  String _tempType = "celcius";
  int _temperatureVal = 25;

  String get temperatureType => _tempType;
  int get temperatureVal => _temperatureVal;

  set changeTemperatureType(String newType) {
    _tempType = newType;
    notifyListeners();
  }

  set changeTermperatureVal(int newTemp) {
    _temperatureVal = newTemp;
    notifyListeners();
  }
}
