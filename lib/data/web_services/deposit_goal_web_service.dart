import 'package:dio/dio.dart';
import 'package:lmizania/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DepositGoalWebServices {
  late Dio dio;
  DepositGoalWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );
    dio = Dio(options);
  }

  depositGoal({required String id, required int amount}) async {
    var pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');

    dio.options.headers['Authorization'] = "Bearer $token";
    try {
      Response response = await dio.post(
        'goals/deposit/$id',
        data: {"amount": amount},
      );
      return response.data;
    } catch (e) {
      print(e.toString());

      return;
    }
  }
}
