import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

Future<void> waitMilliseconds(
  WidgetTester tester,
  int milliseconds,
) async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  var currentClassName = 'waitMilliseconds';

  try {
    // Action: Waiting for x milliseconds
    await tester.pump(Duration(milliseconds: milliseconds));
    await tester.pumpAndSettle();
  } catch (e) {
    throw Exception('Error in $currentClassName: $e');
  }
}
