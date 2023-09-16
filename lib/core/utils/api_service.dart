import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {
  final Dio _dio;
  final String _baseUrl = 'https://asos2.p.rapidapi.com/products/v2/list';

  ApiService(this._dio);

  Future<Map<String, dynamic>> get() async {
    var response = await _dio.get(
      _baseUrl,
      queryParameters: {
        'store': 'US',
        'offset': '0',
        'categoryId': '4210',
        'limit': '48',
        'country': 'US',
        'sort': 'freshness',
        'currency': 'USD',
        'sizeSchema': 'US',
        'lang': 'en-US'
      },
      options: Options(
        headers: {
          'X-RapidAPI-Key': '8333962330msh426c16e1d9aebaap11419fjsn59f23772962c',
          'X-RapidAPI-Host': 'asos2.p.rapidapi.com'
        },
      ),
    );
    print(response.data);
    return response.data;

  }

  Future<Map<String, dynamic>> postData({
    @required String? methodUrl,
    Map<String, dynamic>? query,
    @required Map<String, dynamic>? data,
    String? lang = 'en',
    String? token = '',
  }) async {
    _dio.options.headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var response =
        await _dio.post(methodUrl!, data: data, queryParameters: query);
    return response.data;
  }

  Future<Map<String, dynamic>> putData({
    @required String? methodUrl,
    Map<String, dynamic>? query,
    @required Map<String, dynamic>? data,
    String lang = 'en',
    String? token,
  }) async {
    _dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };
    var response =
        await _dio.put(methodUrl!, queryParameters: query, data: data);
    return response.data;
  }
}
