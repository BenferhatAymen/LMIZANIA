import 'package:dio/dio.dart';
import 'package:lmizania/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetWalletWebServices {
  late Dio dio;
  SetWalletWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );
    dio = Dio(options);
  }

  setWallet({required int ammount}) async {
    var pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');

    dio.options.headers['Authorization'] = "Bearer $token";

    try {
      Response response =
          await dio.post('set_wallet', data: {"amount": ammount});
      return response.data;
    } catch (e) {
      print(e.toString());

      return;
    }
  }
}
