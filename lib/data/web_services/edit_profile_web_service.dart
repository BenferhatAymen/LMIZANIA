import 'package:dio/dio.dart';
import 'package:lmizania/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileWebServices {
  late Dio dio;
  EditProfileWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );
    dio = Dio(options);
  }

  editProfile({
    required String name,
    required String email,
    required String gender,
    String? image,
  }) async {
    var pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');

    dio.options.headers['Authorization'] = "Bearer $token";
    try {
      print("start");
      Response response = await dio.post(
        'editProfile',
        data: {
          "firstName": name,
          "lastName": name,
          "email": email,
          "gender": gender,
          "dateOfBirth": "1990-05-15T00:00:00.000Z",
          "image": image
        },
      );
      print("end");
      return response.data;
    } catch (e) {
      print(e.toString());

      return;
    }
  }
}
