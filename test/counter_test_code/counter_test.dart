import 'package:flutter_test/flutter_test.dart';
import 'package:unit_testing_example/counter_example.dart';

void main(){
  group('Counter',(){
    late Counter counter;

    setUp((){
      counter = Counter();
    });

    test('initial count should be zero',(){
      expect(counter.count,0);
    });

    test('increment should increment count by one',(){
      counter.increment();
      expect(counter.count,1);
    });

    test('decrement should decrement count by one',(){
      counter.increment();
      counter.decrement();
      expect(counter.count,0);
    });

    test('value will be negative',(){
      counter.decrement();
      expect(counter.count,-1);
    });

  });
}