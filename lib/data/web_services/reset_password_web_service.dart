import 'package:dio/dio.dart';
import 'package:lmizania/constants.dart';

class ResetPasswordWebServices {
  late Dio dio;
  ResetPasswordWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );
    dio = Dio(options);
  }
  userResetPassword({required String email, required String password}) async {
    try {
      Response response =
          await dio.post('reset-password', data: {"email": email, "newPassword": password});
      return response.data;
    } catch (e) {
      print(e.toString());

      return;
    }
  }
}
