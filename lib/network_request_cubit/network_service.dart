import 'package:dio/dio.dart';

class NetworkService {
  final Dio dio;
  NetworkService(this.dio);

  Future<String> fetchData() async {
    try {
      final response = await dio.get('https://jsonplaceholder.typicode.com/posts/1');
      return response.data['title'];
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}