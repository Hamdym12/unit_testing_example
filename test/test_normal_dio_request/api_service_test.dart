import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:unit_testing_example/normal_dio_request/api_service.dart';
import 'api_service_test.mocks.dart';

@GenerateMocks([Dio])
void main(){
  late MockDio dio;
  late ApiService apiService;

  setUp((){
    dio = MockDio();
    apiService = ApiService(dio);
  });

  group('fetch Users', (){
    test('returns a list of users', () async {
      when(dio.get('https://jsonplaceholder.typicode.com/users')).thenAnswer((_)async{
        return Response(
          data: [
            {
              "name": "Hamdy Mohamed",
              "username": "Hamdym12",
              "email": "hamdy@yahoo.com",},
            {
              "name": "Leanne Graham",
              "username": "Bret",
              "email": "Sincere@april.biz",
            },
          ],
            statusCode: 200,
            requestOptions: RequestOptions(
              path: 'https://jsonplaceholder.typicode.com/users'
            )
        );
      });
      final users = await apiService.fetchUsers();
      expect(users.length, 2);
      expect(users[0].name, 'Hamdy Mohamed');
      expect(users[1].email, 'Sincere@april.biz');
      print(users[0].name);
    });
  });

}