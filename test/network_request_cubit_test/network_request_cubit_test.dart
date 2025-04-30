import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:unit_testing_example/network_request_cubit/network_cubit.dart';
import 'package:unit_testing_example/network_request_cubit/network_service.dart';
import 'package:unit_testing_example/network_request_cubit/network_states.dart';

class MockNetworkService extends Mock implements NetworkService{}

@GenerateMocks([NetworkService])
void main(){

  group('testing network cubit', () {
    late NetworkCubit networkCubit;
    late MockNetworkService mockNetworkService;

    setUp((){
      mockNetworkService = MockNetworkService();
      networkCubit = NetworkCubit(mockNetworkService);
    });

    tearDown((){
      networkCubit.close();
    });

    test('initial state is NetworkStateInitial', (){
      expect(networkCubit.state, NetworkStateInitial());
    });

    blocTest<NetworkCubit, NetworkState>(
      'emits NetworkStateLoading and NetworkStateLoaded when fetchData is successful',
      build: () {
        when(mockNetworkService.fetchData()).thenAnswer((_) async => 'Test Title');
        return networkCubit;
      },
      act: (cubit) => cubit.fetchData(),
      expect: ()=>[
        NetworkStateLoading(),
        NetworkStateLoaded('Test Title'),
      ],
    );

    blocTest<NetworkCubit, NetworkState>(
      'emits NetworkStateLoading and NetworkStateError when fetchData fails',
      build: () {
        when(mockNetworkService.fetchData()).thenThrow(Exception('Test Error'));
        return networkCubit;
      },
      act: (cubit) => cubit.fetchData(),
      expect: ()=>[
        NetworkStateLoading(),
        NetworkStateError('Test Error'),
      ],
    );


  });
}