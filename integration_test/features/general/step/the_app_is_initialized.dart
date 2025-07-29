import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:integration_test/integration_test.dart';
import 'package:sandbox/main.dart';
import 'package:sandbox_test/utils/extensions.dart';

ProviderContainer? globalProviderContainer;

Future<void> theAppIsInitialized(
  WidgetTester tester,
) async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  var currentClassName = 'theAppIsInitialized';

  globalProviderContainer = ProviderContainer();

  try {
    Widget buildAppWithProviderScope() {
      return UncontrolledProviderScope(
        container: globalProviderContainer!,
        child: EasyLocalization(
          supportedLocales: const [Locale('nl', 'NL'), Locale('en', 'GB')],
          path: 'assets/i18n',
          startLocale: const Locale('nl', 'NL'),
          fallbackLocale: const Locale('nl', 'NL'),
          child: MyApp(),
        ),
      );
    }

    // Action: loading the app widget
    await tester.pumpWidget(buildAppWithProviderScope());
    await tester.pumpUntilFound(find.byType(FloatingActionButton));
  } catch (e) {
    throw Exception('Error in $currentClassName: $e');
  }
}
