import 'package:dio/dio.dart';
import 'package:erastar_apps/app/config/api_path.dart';
import 'package:erastar_apps/app/models/asset_model.dart';
import 'package:erastar_apps/app/models/profile_model.dart';
import 'package:erastar_apps/app/services/local_storage_service.dart';

class HomeController {
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
        return profileRes;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<AssetModel?> getAssetHome() async {
    String? authToken = await LocalStorageService.load("headerToken");
    // final String authToken = await LocalStorageService.load("headerToken");
    // print('cooookkkk ----> ' + authToken.toString());
    try {
      Dio dio = Dio();
      dio.options.contentType = 'JSON';
      dio.options.responseType = ResponseType.json;
      Response response = await dio.get(
        getAPIAssetHome,
        options: Options(
          contentType: 'application/json',
          headers: {
            'era-auth-token': authToken,
          },
        ),
      );
      print('response asset home $response');
      if (response.statusCode == 200) {
        // ProfileModel profileRes = ProfileModel.fromJson(response.data);
        // return profileRes;
        return null;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
