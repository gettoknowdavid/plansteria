import 'package:flutter_test/flutter_test.dart';
import 'package:plansteria/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('SharedPreferencesServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
