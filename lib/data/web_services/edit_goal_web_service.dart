import 'package:dio/dio.dart';
import 'package:lmizania/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditGoalWebServices {
  late Dio dio;
  EditGoalWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );
    dio = Dio(options);
  }

  editGoal(
      {required String name,
      required String category,
      required int amount,
      required String date}) async {
    var pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');

    dio.options.headers['Authorization'] = "Bearer $token";
    try {
      Response response = await dio.put(
        'expense',
        data: {
          "name": name,
          "category": category,
          "amount": amount,
          "date": date
        },
      );
      return response.data;
    } catch (e) {
      print(e.toString());

      return;
    }
  }
}
