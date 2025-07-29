// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import './step/the_app_is_initialized.dart';
import './step/at_least_one_widget_should_have_text.dart';
import './step/tap_floating_action_button_by_tooltip.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('''tap_test.feature''', () {
    testWidgets('''tap stuff''', (tester) async {
      await theAppIsInitialized(tester);
      await atLeastOneWidgetShouldHaveText(tester, '0');
      await tapFloatingActionButtonByTooltip(tester, 'Increment');
      await atLeastOneWidgetShouldHaveText(tester, '1');
      await tapFloatingActionButtonByTooltip(tester, 'Increment');
      await atLeastOneWidgetShouldHaveText(tester, '2');
      await tapFloatingActionButtonByTooltip(tester, 'Increment');
      await tapFloatingActionButtonByTooltip(tester, 'Increment');
      await tapFloatingActionButtonByTooltip(tester, 'Increment');
      await atLeastOneWidgetShouldHaveText(tester, '5');
    });
  });
}
