import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:erastar_apps/app/config/api_path.dart';
import 'package:erastar_apps/app/models/profile_model.dart';
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

        // ProfileModel homeRes = ProfileModel.fromJson(response.data);
        // print("balikan ata " + '${homeRes}');
        return response;
      }
      return null;

      //return ;
    } on DioException catch (e) {
      print(e.response!.data);
      //RegistrasiModel homeRes1 = RegistrasiModel.fromJson(e.response.data);
      //  return "failed";
    }
    return null;
    // return null;
  }

  // static Future<Map<String, dynamic>> loginProfile({
  //   String? phoneNumber,
  //   String? password,
  // }) async {
  //   // String fcmToken = await LocalStorageService.load("fcmToken");

  //   try {
  //     Dio dio = Dio();
  //     Response response = await dio.post(
  //       postAPILogin,
  //       data: {
  //         "phone": phoneNumber,
  //         "password": password,
  //         "level_user": 5,
  //         "fcm_token": '',
  //         // "fcm_token": fcmToken
  //       },
  //     );
  //     print(response.statusCode);

  //     return {"statusCode": response.statusCode, "data": response.data};
  //   } on DioError catch (e) {
  //     print(e.response!);
  //     return {
  //       "statusCode": e.response!.statusCode,
  //       "message": e.response!.data["message"]
  //     };
  //   }
  // }

  getData() async {
    verifykl = 11;

    notifyListeners();
  }
}
