import 'package:flutter_test/flutter_test.dart';

/// Example: Then at least one widget should have text {'07:00-12:00'}
Future<void> atLeastOneWidgetShouldHaveText(WidgetTester tester, String text) async {
  var currentClassName = 'atLeastOneWidgetShouldHaveText';

  try {
    await tester.pumpAndSettle();
    // Check if at least one widget has the specified text
    expect(
      find.text(text),
      findsAny,
      reason: 'Expected at least one widget to have text "$text", but none were found in the widget tree.',
    );
  } catch (e) {
    throw Exception('Error in $currentClassName: Failed to find widget with text "$text": $e');
  }
}
