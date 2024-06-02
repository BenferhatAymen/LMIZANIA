import 'package:dio/dio.dart';
import 'package:lmizania/constants.dart';

class LoginWebServices {
  late Dio dio;
  LoginWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );
    dio = Dio(options);
  }
  userLogin({required String email, required String password}) async {
    try {
      Response response =
          await dio.post('login', data: {"email": email, "password": password});
      return response.data;
    } catch (e) {
      print(e.toString());

      return;
    }
  }
}
