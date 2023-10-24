// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:erastar_apps/app/config/api_path.dart';
import 'package:erastar_apps/app/models/invoice_detail_model.dart';
import 'package:erastar_apps/app/models/invoice_model.dart';
import 'package:erastar_apps/app/services/local_storage_service.dart';

class SalesController {
  //Get Invoice Data in Home Screen
  Future<InvoiceModel?> getInvoice() async {
    String? authToken = await LocalStorageService.load("headerToken");
    try {
      var params = {
        "page": 1,
        "limit": '',
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

  Future<DetailInvoiceModel?> getDetailInvoice(String? idInvoice) async {
    String? authToken = await LocalStorageService.load("headerToken");
    try {
      Dio dio = Dio();
      dio.options.contentType = 'JSON';
      dio.options.responseType = ResponseType.json;
      Response response = await dio.get(
        '$getAPIInvoiceDetail$idInvoice',
        options: Options(
          contentType: 'application/json',
          headers: {
            'era-auth-token': authToken,
          },
        ),
      );
      print('response detailInvoiceModel $response');
      if (response.statusCode == 200) {
        DetailInvoiceModel detailInvoiceModel =
            DetailInvoiceModel.fromJson(response.data);

        return detailInvoiceModel;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
