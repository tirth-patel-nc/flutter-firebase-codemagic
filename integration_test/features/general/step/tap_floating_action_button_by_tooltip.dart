import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:sandbox_test/steps/wait_milliseconds.dart';

Future<void> tapFloatingActionButtonByTooltip(
  WidgetTester tester,
  String tooltip,
) async {
  var binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  var currentClassName = 'tapFloatingActionButtonByTooltip';

  try {
    var buttons = find.byElementPredicate((element) {
      if (element.widget.runtimeType != FloatingActionButton) {
        return false;
      }
      return (element.widget as FloatingActionButton).tooltip == tooltip;
    });

    expect(buttons, findsOneWidget, reason: 'Expected to find a button labeled "$tooltip" in the dialog.');

    await tester.tap(buttons.first);
    await tester.pumpAndSettle();
    await waitMilliseconds(tester, 500);
  } catch (e) {
    throw Exception(
      'Error in $currentClassName: Error tapping button with tooltip "$tooltip": $e',
    );
  }
}
