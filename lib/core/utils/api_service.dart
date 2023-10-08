import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final String _baseUrl = 'https://asos2.p.rapidapi.com/products/';

  ApiService(this._dio);

  Future<Map<String, dynamic>> get(
      {required String endPoint, Map<String, dynamic>? queryParams}) async {
    var response = await _dio.get(
      '$_baseUrl$endPoint',
      queryParameters: queryParams,
      options: Options(
        headers: {
          'X-RapidAPI-Key':
              'cf3c2bacefmsh0970afc0d2f3adfp1eb3a2jsnda1f282ba2f2',
          'X-RapidAPI-Host': 'asos2.p.rapidapi.com'
        },
      ),
    );
    return response.data;
  }

//   Future<Map<String, dynamic>> postData({
//     @required String? methodUrl,
//     Map<String, dynamic>? query,
//     @required Map<String, dynamic>? data,
//     String? lang = 'en',
//     String? token = '',
//   }) async {
//     _dio.options.headers = {
//       'lang': 'en',
//       'Content-Type': 'application/json',
//       'Authorization': token,
//     };
//     var response =
//         await _dio.post(methodUrl!, data: data, queryParameters: query);
//     return response.data;
//   }
//
//   Future<Map<String, dynamic>> putData({
//     @required String? methodUrl,
//     Map<String, dynamic>? query,
//     @required Map<String, dynamic>? data,
//     String lang = 'en',
//     String? token,
//   }) async {
//     _dio.options.headers = {
//       'lang': lang,
//       'Content-Type': 'application/json',
//       'Authorization': token ?? '',
//     };
//     var response =
//         await _dio.put(methodUrl!, queryParameters: query, data: data);
//     return response.data;
//   }
}
