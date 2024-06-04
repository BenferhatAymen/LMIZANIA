import 'package:dio/dio.dart';
import 'package:lmizania/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetSavingsWebServices {
  late Dio dio;
  GetSavingsWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );
    dio = Dio(options);
  }

  getSavings() async {
    var pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');

    dio.options.headers['Authorization'] = "Bearer $token";

    try {
      print("cv");
      Response response = await dio.get('getSaving');
      print(response.data);
      print("hmd");
      return response.data;
    } catch (e) {
      print(e.toString());

      return;
    }
  }
}
