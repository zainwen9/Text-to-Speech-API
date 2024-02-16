import 'package:dio/dio.dart';
import 'dart:developer';
import 'package:talking/custom_snakbar.dart';

//.......................................................................
Future sendApiRequest(
    {Map<String, dynamic>? data,
    String? token,
    required String url,
    required ctx,
    required String requestType}) async {
  Dio dio = Dio();

  try {
    Response? response;
    if (requestType == "GET") {
      response = await dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Basic $token',
            "accept": "application/json",
            "Content-Type": "application/json",
          },
        ),
      );
    } else if (requestType == "PUT") {
      response = await dio.put(
        url,
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            "accept": "application/json",
            "Content-Type": "application/json",
          },
        ),
      );
    } else if (requestType == "POST") {
      response = await dio.post(
        url,
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Basic $token',
            "Content-Type": "application/json",
          },
        ),
      );
    }

    if (response != null) {
      return response.data;
    }
  } on DioException catch (e) {
    if (e.response == null) {
      log("Api $url not working error 00 is : $e");
    } else if (e.response!.statusCode == 400) {
      final errorResponse = e.response!.data;
      print(errorResponse.toString());
      String errorMessage = errorResponse["description"];

      snaki(context: ctx, msg: errorMessage);
    } else if (e.response!.statusCode == 401) {
      final errorResponse = e.response!.data;
      String errorMessage = errorResponse["message"];
      snaki(context: ctx, msg: errorMessage);
    } else if (e.response!.statusCode == 409) {
      final errorResponse = e.response!.data;
      String errorMessage = errorResponse["message"];

      snaki(context: ctx, msg: errorMessage);
    } else if (e.response!.statusCode == 403) {
      final errorResponse = e.response!.data;
      String errorMessage = errorResponse["message"];

      snaki(context: ctx, msg: errorMessage);
    } else {
      log("Api $url not working error 01 is : $e");
    }
    return null;
  }
}

class RequestType {
  static const String GET = "GET";
  static const String POST = "POST";
  static const String PUT = "PUT";
  static const String DELETE = "DELETE";
}
