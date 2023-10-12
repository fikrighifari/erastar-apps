import 'package:dio/dio.dart';
import 'package:erastar_apps/app/config/api_path.dart';
import 'package:erastar_apps/app/models/top_marketing_model.dart';
import 'package:erastar_apps/app/services/local_storage_service.dart';

class TopMarketingController {
  Future<TopMarketingModel?> getTopMarketing() async {
    String? authToken = await LocalStorageService.load("headerToken");
    try {
      var params = {
        "page": 1,
        "limit": 10,
        "sort": "desc",
        "get_date": "auto",
      };
      Dio dio = Dio();
      dio.options.contentType = 'JSON';
      dio.options.responseType = ResponseType.json;
      Response response = await dio.get(
        getAPITopMarketing,
        queryParameters: params,
        options: Options(
          contentType: 'application/json',
          headers: {
            'era-auth-token': authToken,
          },
        ),
      );
      // print('response top marketing $response');
      if (response.statusCode == 200) {
        // print(response.statusCode);
        TopMarketingModel topMarketingRes =
            TopMarketingModel.fromJson(response.data);
        // print(assetRes.dataAsset!.data.first.images!.path);
        return topMarketingRes;
      } else {
        return null;
      }
    } catch (e) {
      print('error Asset $e');
      // print(e);
      return null;
    }
  }
}
