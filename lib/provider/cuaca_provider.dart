import 'package:uas_06tplm006_201011401202/model/cuaca_model.dart';
import 'package:uas_06tplm006_201011401202/service/cuaca_service.dart';
import 'package:flutter/material.dart';

class CuacaProvider extends ChangeNotifier {
  TextEditingController cityNameText = TextEditingController();
  CuacaService cuacaService = CuacaService();
  CuacaModel cuacaModel = CuacaModel();

  showWeatherData() async {
    cuacaModel = await cuacaService.getCurrentWeather(cityNameText.text);
    notifyListeners();
  }
}
