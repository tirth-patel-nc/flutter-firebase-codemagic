import 'package:flutter_test/flutter_test.dart';
import 'package:sandbox_test/steps/wait_milliseconds.dart';

/// Usage: at least one widget should have text {'Flutter Demo Home Page'}
Future<void> atLeastOneWidgetShouldHaveText(WidgetTester tester, String text) async {
  var currentClassName = 'atLeastOneWidgetShouldHaveText';

  try {
    // Check if at least one widget has the specified text
    await waitMilliseconds(tester, 2000);
    expect(
      find.text(text),
      findsAny,
      reason: 'Expected at least one widget to have text "$text", but none were found in the widget tree.',
    );
    await waitMilliseconds(tester, 2000);
  } catch (e) {
    throw Exception('Error in $currentClassName: Failed to find widget with text "$text": $e');
  }
}
