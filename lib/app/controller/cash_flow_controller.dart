// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:erastar_apps/app/config/api_path.dart';
import 'package:erastar_apps/app/models/approval_cost_model.dart';
import 'package:erastar_apps/app/models/cash_flow_detail_model.dart';
import 'package:erastar_apps/app/models/cash_flow_model.dart';
import 'package:erastar_apps/app/models/cost_detail_model.dart';
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

  //Get Approval List
  Future<ApprovalCostModel?> getApproval() async {
    try {
      String? authToken = await LocalStorageService.load("headerToken");
      var params = {
        "page": 1,
        "limit": 4,
        "sort": "desc",
        "status": "pending",
      };

      Dio dio = Dio();
      dio.options.contentType = 'JSON';
      dio.options.responseType = ResponseType.json;
      Response response = await dio.get(
        getAPIApprovalCost,
        queryParameters: params,
        options: Options(
          contentType: 'application/json',
          headers: {
            'era-auth-token': authToken,
          },
        ),
      );
      // print('response approval cashflow screen $response');
      if (response.statusCode == 200) {
        // print(response.statusCode);
        ApprovalCostModel approvalCostModel =
            ApprovalCostModel.fromJson(response.data);
        return approvalCostModel;
      } else {
        return null;
      }
    } catch (e) {
      print('Error Approval $e');
      // print(e);
      return null;
    }
  }

  Future<DetailCostModel?> getDetailCost(String? idCost) async {
    String? authToken = await LocalStorageService.load("headerToken");
    try {
      Dio dio = Dio();
      dio.options.contentType = 'JSON';
      dio.options.responseType = ResponseType.json;
      Response response = await dio.get(
        '$getAPIApprovalCostDetail/$idCost',
        options: Options(
          contentType: 'application/json',
          headers: {
            'era-auth-token': authToken,
          },
        ),
      );
      // print('response detailCost $response');
      if (response.statusCode == 200) {
        DetailCostModel detailCostRes = DetailCostModel.fromJson(response.data);

        return detailCostRes;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<Response> approveCost(
    String costId,
    String invoiceId,
  ) async {
    String token = await LocalStorageService.load("headerToken");
    try {
      Dio dio = Dio();
      return await dio.put(putAPIApproveCost,
          data: {
            "cost_id": costId,
            "invoice_id": invoiceId,
            "status": "approved"
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

  Future<DetailCashFlow?> getDetailCashFlow(String? idInvoice) async {
    String? authToken = await LocalStorageService.load("headerToken");
    try {
      Dio dio = Dio();
      dio.options.contentType = 'JSON';
      dio.options.responseType = ResponseType.json;
      Response response = await dio.get(
        '$getAPICashFlowDetail$idInvoice',
        options: Options(
          contentType: 'application/json',
          headers: {
            'era-auth-token': authToken,
          },
        ),
      );
      // print('response detail arus kas $response');
      if (response.statusCode == 200) {
        DetailCashFlow detailCashFlow = DetailCashFlow.fromJson(response.data);

        return detailCashFlow;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
