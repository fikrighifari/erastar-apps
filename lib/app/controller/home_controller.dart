// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:erastar_apps/app/config/api_path.dart';
import 'package:erastar_apps/app/models/approval_cost_model.dart';
import 'package:erastar_apps/app/models/asset_model.dart';
import 'package:erastar_apps/app/models/cash_flow_model.dart';
import 'package:erastar_apps/app/models/invoice_model.dart';
import 'package:erastar_apps/app/models/profile_model.dart';
import 'package:erastar_apps/app/services/local_storage_service.dart';

class HomeController {
  //Get Profile in Home Screen
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

  //Get Asset in Home Screen
  Future<AssetModel?> getAssetHome() async {
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

  //Get Pending Approval in Home Screen
  Future<ApprovalCostModel?> getApprovalHome() async {
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
      // print('response approval home $response');
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

  //Get Cash Flow Data in Home Screen
  Future<CashFlowModel?> getCashFlowHome() async {
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

  //Get Invoice Data in Home Screen
  Future<InvoiceModel?> getInvoiceHome() async {
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
        getAPIInvoice,
        queryParameters: params,
        options: Options(
          contentType: 'application/json',
          headers: {
            'era-auth-token': authToken,
          },
        ),
      );
      // print('response invoice home $response');
      if (response.statusCode == 200) {
        // print(response.statusCode);
        InvoiceModel invoiceModel = InvoiceModel.fromJson(response.data);
        return invoiceModel;
      } else {
        return null;
      }
    } catch (e) {
      print('Error Invoice $e');
      // print(e);
      return null;
    }
  }
}
