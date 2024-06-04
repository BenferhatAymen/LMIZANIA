import 'package:dio/dio.dart';
import 'package:lmizania/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateGroupWebServices {
  late Dio dio;
  CreateGroupWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );
    dio = Dio(options);
  }

  createGroup({
    required String name,
    required String image,
  }) async {
    var pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');

    dio.options.headers['Authorization'] = "Bearer $token";
    try {
      Response response = await dio.post(
        'createGroup',
        data: {
          "name": name,
          "image": image,
        },
      );
      return response.data;
    } catch (e) {
      print(e.toString());

      return;
    }
  }
}
