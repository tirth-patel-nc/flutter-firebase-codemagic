import 'package:flutter_test/flutter_test.dart';

extension WidgetTesterExtensions on WidgetTester {
  /// Pumps the widget tree with a delay in between, for a specified number of times.
  /// This is useful when `pumpAndSettle` doesn't work as expected (e.g., with Riverpod).
  Future<void> pumpRepeatedly({
    int times = 5,
    Duration delay = const Duration(seconds: 1),
  }) async {
    for (var i = 0; i < times; i++) {
      await pump(delay);
    }
  }

  Future<void> pumpUntilFound(
    Finder finder, {
    Duration delay = const Duration(seconds: 1),
    int tries = 10,
    bool Function(Finder)? matcher,
  }) async {
    var found = false;
    for (var i = 0; i < tries && !found; i++) {
      await pump(delay);
      found = matcher != null ? matcher(finder) : finder.tryEvaluate();
    }
  }
}
