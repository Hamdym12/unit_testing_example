import 'package:dio/dio.dart';

class ApiService{
  final Dio dio;
  ApiService(this.dio);

  Future<void> fetchUsers() async{
    try{
      final response = await dio.get('https://jsonplaceholder.typicode.com/users');
      if(response.statusCode == 200){
        print('Success');
      }else{
        print('Error');
        throw Exception('Failed to fetch users');
      }
      print(response.data);
    }catch(e){
      print('Error: $e');
      throw Exception('Error: $e');
    }
    }
}
