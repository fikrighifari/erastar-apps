// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:erastar_apps/app/config/api_path.dart';
import 'package:erastar_apps/app/models/asset_detail_model.dart';
import 'package:erastar_apps/app/models/asset_model.dart';
import 'package:erastar_apps/app/models/profile_model.dart';
import 'package:erastar_apps/app/services/local_storage_service.dart';

class AssetController {
  //Get Profile in Asset Screen
  Future<ProfileModel?> getProfile() async {
    String? authToken = await LocalStorageService.load("headerToken");
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

  Future<AssetModel?> getAsset() async {
    String? authToken = await LocalStorageService.load("headerToken");
    try {
      var params = {
        "page": 1,
        "limit": 4,
        "sort": "desc",
      };
      Dio dio = Dio();
      dio.options.contentType = 'JSON';
      dio.options.responseType = ResponseType.json;
      Response response = await dio.get(
        getAPIAsset,
        queryParameters: params,
        options: Options(
          contentType: 'application/json',
          headers: {
            'era-auth-token': authToken,
          },
        ),
      );
      // print('response asset home $response');
      if (response.statusCode == 200) {
        // print(response.statusCode);
        AssetModel assetRes = AssetModel.fromJson(response.data);
        // print(assetRes.dataAsset!.data.first.images!.path);
        return assetRes;
      } else {
        return null;
      }
    } catch (e) {
      print('error Asset $e');
      // print(e);
      return null;
    }
  }

  Future<DetailAssetModel?> getDetailAsset(String? idAsset) async {
    String? authToken = await LocalStorageService.load("headerToken");
    try {
      Dio dio = Dio();
      dio.options.contentType = 'JSON';
      dio.options.responseType = ResponseType.json;
      Response response = await dio.get(
        '$getAPIAssetDetail/$idAsset',
        options: Options(
          contentType: 'application/json',
          headers: {
            'era-auth-token': authToken,
          },
        ),
      );
      // print('response detailAsset $response');
      if (response.statusCode == 200) {
        DetailAssetModel detailAssetRes =
            DetailAssetModel.fromJson(response.data);

        return detailAssetRes;
      } else {
        return null;
      }
    } catch (e) {
      print('error sini');
      print(e);
      return null;
    }
  }
}
