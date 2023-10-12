import 'package:dio/dio.dart';
import 'package:erastar_apps/app/config/api_path.dart';
import 'package:erastar_apps/app/models/cash_flow_model.dart';
import 'package:erastar_apps/app/services/local_storage_service.dart';

class CashFlowController {
  //Get CashFlow List
  Future<CashFlowModel?> getCashFlow() async {
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
        getAPICashFlow,
        queryParameters: params,
        options: Options(
          contentType: 'application/json',
          headers: {
            'era-auth-token': authToken,
          },
        ),
      );
      // print('response cash flow home $response');
      if (response.statusCode == 200) {
        // print(response.statusCode);
        CashFlowModel cashFlowModel = CashFlowModel.fromJson(response.data);
        return cashFlowModel;
      } else {
        return null;
      }
    } catch (e) {
      print('Error Cash Flow $e');
      // print(e);
      return null;
    }
  }
}
