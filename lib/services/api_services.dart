import 'package:dio/dio.dart';
import 'package:fetcdata/constants/api_contstant.dart';

class ApiService {
  final Dio dio = Dio();

  ApiService();

  Future<Response?> getResponse() async {
    try {
      final Response? response = await dio.get("$baseUrl/$post");
      return response;
    } catch (e) {
      print("$e");
    }
  }
}
