import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:universal_html/html.dart' as html;
import 'package:web_evaluation/constants/singleton.dart';
import 'package:web_evaluation/screens/dashboard/dashboard_screen.dart';
import 'package:web_evaluation/screens/dashboard/watchlist_screen.dart';
import 'package:web_evaluation/screens/login/login_screen.dart';
import 'package:web_evaluation/screens/orders/order_screen.dart';
import 'package:web_evaluation/screens/pagenotfound/page_not_found.dart';
import 'package:web_evaluation/screens/wallet/walletscreen.dart';

import '../constants/app_constants.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

class Routers {
  late final GoRouter router = GoRouter(
    errorBuilder: (context, state) => const PageNotFound(),
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        redirect: (context, state) {
          return loginroute;
        },
      ),
      GoRoute(
        path: loginroute,
        pageBuilder: (context, state) {
          return NoTransitionPage(
            key: state.pageKey,
            child: const LoginScreen(),
          );
        },
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return DashBoardScreen(child);
        },
        routes: <RouteBase>[
          GoRoute(
            path: watchlistroute,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                key: state.pageKey,
                child: const WatchListScreen(),
              );
            },
          ),
          GoRoute(
            path: walletroute,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                key: state.pageKey,
                child: const WalletScreen(),
              );
            },
          ),
          GoRoute(
            path: orderroute,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                key: state.pageKey,
                child: const OrderScreen(),
              );
            },
          ),
        ],
      ),
    ],
    redirect: (context, state) async {
      late String authtokens;
      if (SingletonScaffold().isEndrawerOpen) {
        GoRouter.of(_rootNavigatorKey.currentContext!).pop();
      }

      if (html.window.localStorage.containsKey(authToken)) {
        authtokens = html.window.localStorage[authToken]!;

        if (authtokens.isEmpty) {
          return loginroute;
        } else if (state.matchedLocation == loginroute ||
            state.matchedLocation == '/') {
          return watchlistroute;
        }
      } else {
        return loginroute;
      }
      return null;
    },
  );
}
