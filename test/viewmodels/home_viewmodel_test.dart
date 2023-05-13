import 'package:flutter_test/flutter_test.dart';
import 'package:plansteria/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('HomeViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    group('incrementCounter -', () {
      test('When called once should return  Counter is: 1', () {
        // final model = _getModel();
      });
    });

    group('showBottomSheet -', () {
      test('When called, should show custom bottom sheet using notice variant',
          () {});
    });
  });
}
