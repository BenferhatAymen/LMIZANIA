import 'package:dio/dio.dart';
import 'package:lmizania/constants.dart';

class RegisterWebServices {
  late Dio dio;
  RegisterWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );
    dio = Dio(options);
  }
  userRegister(
      {required String email,
      required String password,
      required String fullName}) async {
    try {
       Response response = await dio.post('register', data: {
        "email": email,
        "password": password,
        "firstName": fullName,
        "lastName": fullName,
      });
      return response.data;
    } catch (e) {
 
      print(e.toString());
 
      return;
    }
  }
}
