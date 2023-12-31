// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:erastar_apps/app/config/api_path.dart';
import 'package:erastar_apps/app/models/profile_model.dart';
import 'package:erastar_apps/app/services/local_storage_service.dart';

class ProfileController {
  Future<ProfileModel?> getProfile() async {
    String? authToken = await LocalStorageService.load("headerToken");
    // final String authToken = await LocalStorageService.load("headerToken");
    // print('cooookkkk ----> ' + authToken.toString());
    try {
      Dio dio = Dio();
      dio.options.contentType = 'JSON';
      dio.options.responseType = ResponseType.json;
      Response response = await dio.get(
        getAPIProfile,
        options: Options(
          contentType: 'application/json',
          headers: {
            'era-auth-token': authToken,
          },
        ),
      );
      // print('response profile data $response');
      if (response.statusCode == 200) {
        ProfileModel profileRes = ProfileModel.fromJson(response.data);
        // print('profile masuk aja');

        return profileRes;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<Response> changePassword(
    String password,
    String confirmPassword,
  ) async {
    String token = await LocalStorageService.load("headerToken");
    try {
      Dio dio = Dio();
      return await dio.put(putChangePassword,
          data: {
            "password": password,
            "confirm_password": confirmPassword,
          },
          options: Options(
              headers: {"era-auth-token": token},
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }));
    } on DioError catch (e) {
      return e.response!;
    }
  }
}
