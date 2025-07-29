import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sandbox/main.dart';

var routerKey = GlobalKey<NavigatorState>();

class AppRoute {
  static const startScreen = '/';

  static String getRoute(route, param, value) {
    return '$route?$param=$value';
  }

  static String getCurrentRoute() {
    var router = GoRouter.of(routerKey.currentContext!);
    var lastMatch = router.routerDelegate.currentConfiguration.last;
    var matchList = lastMatch is ImperativeRouteMatch ? lastMatch.matches : router.routerDelegate.currentConfiguration;
    var location = matchList.uri.toString();
    return location;
  }
}

final routerService = Provider<GoRouter>((ref) {
  GoRoute getRoute({required String path, required Widget Function(BuildContext, GoRouterState) builder}) {
    return GoRoute(
      path: path,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        transitionDuration: const Duration(milliseconds: 200),
        child: builder(context, state),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeIn).animate(animation),
            child: child,
          );
        },
      ),
    );
  }

  return GoRouter(
    navigatorKey: routerKey,
    initialLocation: AppRoute.startScreen,
    routes: [
      getRoute(
        path: AppRoute.startScreen,
        builder: (context, state) {
          return const MyHomePage(title: 'Flutter Demo Home Page');
        },
      ),
    ],
  );
});
