import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class Api extends Equatable {
  const Api(this._dio);

  final Dio _dio;
  final String _baseUrl = 'https://api.themoviedb.org/3/';
  final String _apiKey = 'api_key=b50ef783c01a58cbc7ab3a31c99227b1';

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    Response response = await _dio.get('$_baseUrl$endPoint?$_apiKey');
    return response.data;
  }

  @override
  List<Object> get props => [_dio, _baseUrl, _apiKey];
}
