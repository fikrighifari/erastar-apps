import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:erastar_apps/app/config/api_path.dart';
import 'package:erastar_apps/app/services/local_storage_service.dart';
import 'package:erastar_apps/export.dart';

class AuthServices extends ChangeNotifier {
  int? verifykl;

  Future<dynamic> loginProfile(
    BuildContext context,
    String phoneNumber,
    String password,
  ) async {
    Map<String, dynamic> body = {
      "email": phoneNumber,
      "password": password,
      "device": 'mobile',
      "fcm_token": '',
    };
    try {
      Dio dio = Dio();
      Response response = await dio.post(postAPILogin,
          data: jsonEncode(body),
          options: Options(
            contentType: 'application/json',
          ));

      // print("response  Data $response");
      // print(response.data['token']);

      if (response.statusCode == 200) {
        await LocalStorageService.save(
            "headerToken", response.data['token'].toString());

        return response;
      }
      return null;

      //return ;
    } on DioException catch (e) {
      print(e.response!.data);
    }
    return null;
    // return null;
  }

  getData() async {
    verifykl = 11;

    notifyListeners();
  }
}
