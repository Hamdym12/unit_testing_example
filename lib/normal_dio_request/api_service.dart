import 'package:dio/dio.dart';

import 'model/user_model.dart';

class ApiService{
  final Dio dio;
  ApiService(this.dio);

  Future<List<User>> fetchUsers() async{
    try{
      final response = await dio.get('https://jsonplaceholder.typicode.com/users');
      if(response.statusCode == 200){
        return (response.data as List).map((user) => User.fromJson(user)).toList();
      }else{
        throw Exception('Failed to fetch users');
      }
    }catch(e){
      throw Exception('Error: $e');
    }
  }
}
