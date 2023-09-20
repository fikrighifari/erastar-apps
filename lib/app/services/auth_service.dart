import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:erastar_apps/app/config/api_path.dart';
import 'package:erastar_apps/app/models/profile_model.dart';
import 'package:erastar_apps/export.dart';

class AuthServices extends ChangeNotifier {
  int? verifykl;

  Future<ProfileModel?> loginProfile(
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

      print("response  Data $response");

      if (response.statusCode == 200) {
        ProfileModel homeRes = ProfileModel.fromJson(response.data);
        // print("balikan ata " + '${homeRes}');
        return homeRes;
      }
      return null;

      //return ;
    } on DioException catch (e) {
      print('sini error ');
      print(e);
      //RegistrasiModel homeRes1 = RegistrasiModel.fromJson(e.response.data);
      //  return "failed";
    }
    return null;
    // return null;
  }

  getData() async {
    verifykl = 11;

    notifyListeners();
  }
}
