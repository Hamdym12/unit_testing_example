import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:unit_testing_example/normal_dio_request/api_service.dart';
import 'api_service_test.mocks.dart';

@GenerateMocks([Dio])
void main(){
  late MockDio mockDio;
  late ApiService apiService;

  setUp((){
    mockDio = MockDio();
    apiService = ApiService(mockDio);
  });

  group('fetch Users', (){
    test('returns a list of users', () async {
      when(mockDio.get('https://jsonplaceholder.typicode.com/users')).thenAnswer((_)async{
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

    test('throws an exception if the API call fails', () async {
      when(mockDio.get('https://jsonplaceholder.typicode.com/users')).thenThrow((_)async{
        return DioException(
            error: 'Failed to fetch users',
            requestOptions: RequestOptions(
                path: 'https://jsonplaceholder.typicode.com/users'
            )
        );
      });
      expect(apiService.fetchUsers(), throwsA(isInstanceOf<Exception>()));
    });


    test('throws an exception if the Status code is not 200', () async {
      when(mockDio.get('https://jsonplaceholder.typicode.com/users')).thenThrow((_)async{
        return Response(
            statusCode: 404,
            data: 'Not Found',
            requestOptions: RequestOptions(
                path: 'https://jsonplaceholder.typicode.com/users'
            )
        );
      });
      expect(apiService.fetchUsers(), throwsA(isInstanceOf<Exception>()));
    });
  });
}