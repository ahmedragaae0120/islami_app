import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:islami_app/ui/screens/home/tabs/radio_tab/model/RadioResponse.dart';

class ApiManager {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(baseUrl: "https://mp3quran.net"));
  }

  static Future<Response> getRequest(
      {required String endpoint, Map<String, dynamic>? queryParameters}) async {
    var response = await dio.get(endpoint, queryParameters: queryParameters);
    return response;
  }

  static Future<Either<RadioResponse, String>> getRadio() async {
    try {
      var response = await getRequest(
          endpoint: "/api/v3/radios", queryParameters: {'language': 'ar'});
      RadioResponse result = RadioResponse.fromJson(response.data);
      return Left(result);
    } catch (error) {
      return Right(error.toString());
    }
  }
}
