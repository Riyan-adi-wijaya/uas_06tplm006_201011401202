import 'package:uas_06tplm006_201011401202/model/cuaca_model.dart';
import 'package:dio/dio.dart';

class CuacaService {
  final dio = Dio();

  Future<CuacaModel> getCurrentWeather(String cityName) async {
    final response = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?q=${cityName}&appid=04910320575f4a0143e42fa84513045e&units=metric');
    print(response.requestOptions.path);
    return CuacaModel.fromJson(response.data);
  }
}
