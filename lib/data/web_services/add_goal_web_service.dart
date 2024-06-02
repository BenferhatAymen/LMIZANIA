import 'package:dio/dio.dart';
import 'package:lmizania/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddGoalWebServices {
  late Dio dio;
  AddGoalWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );
    dio = Dio(options);
  }

  addGoal(
      {required String name,
      required String description,
      required int targetAmount,
      required String image}) async {
    var pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');

    dio.options.headers['Authorization'] = "Bearer $token";
    try {
      Response response = await dio.post(
        'create_goals',
        data: {
          "name": name,
          "description": description,
          "targetAmount": targetAmount,
          "image": image
        },
      );
      return response.data;
    } catch (e) {
      print(e.toString());

      return;
    }
  }
}
