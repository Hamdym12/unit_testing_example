import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_testing_example/counter_cubit.dart';

void main(){
  group('testing counter cubit', (){
    late CounterCubit counterCubit;

    setUp((){
      counterCubit = CounterCubit();
    });

    tearDown((){
      counterCubit.close();
    });

    test('initial state is 0', (){
      expect(counterCubit.state, 0);
    });

    blocTest<CounterCubit, int>(
      'decrement emits -1 when decrement is called',
      build: () =>counterCubit,
      act: (cubit) => cubit.decrement(),
      expect: ()=>[-1],
    );

    blocTest<CounterCubit, int>(
      'increment emits +1 when increment is called',
      build: () =>counterCubit,
      act: (cubit) => cubit.increment(),
      expect: ()=>[1],
    );


  });
}