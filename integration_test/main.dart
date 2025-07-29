import 'features/general/basic_test_test.dart' as basic_test;
import 'features/general/tap_test_test.dart' as tap_test;

Future<void> main() async {
  tap_test.main();
  basic_test.main();
}
