import 'package:flutter/material.dart';
import 'package:flutter_test_go_router/constantes/constantes.dart';
import 'package:flutter_test_go_router/controllers/navigation_bar_controller.dart';
import 'package:flutter_test_go_router/navigator_observer.dart';
import 'package:flutter_test_go_router/pages/activities_page.dart';
import 'package:flutter_test_go_router/pages/forgot_password_page.dart';
import 'package:flutter_test_go_router/pages/home_page.dart';
import 'package:flutter_test_go_router/pages/login_page.dart';
import 'package:flutter_test_go_router/pages/not_found_page.dart';
import 'package:flutter_test_go_router/pages/notifications_page.dart';
import 'package:flutter_test_go_router/pages/profile_page.dart';
import 'package:flutter_test_go_router/pages/register_page.dart';
import 'package:flutter_test_go_router/pages/search_page.dart';
import 'package:flutter_test_go_router/pages/settings_page.dart';
import 'package:flutter_test_go_router/pages/validate_user_page.dart';
import 'package:flutter_test_go_router/pages/welcome_page.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final shellHomeNavigatorKey = GlobalKey<NavigatorState>();
  static final shellSearchNavigatorKey = GlobalKey<NavigatorState>();
  static final shellNotificationsNavigatorKey = GlobalKey<NavigatorState>();
  static final shellProfileNavigatorKey = GlobalKey<NavigatorState>();

  static String? getCurrentLocation(BuildContext context) {
    final GoRouterState state = GoRouterState.of(context);
    return state.name;
  }

  static String? getCurrentFullPath(BuildContext context) {
    final GoRouterState state = GoRouterState.of(context);
    return state.fullPath;
  }

  static final goRouter = GoRouter(
    initialLocation: "/home",
    navigatorKey: rootNavigatorKey,
    observers: [MyNavigatorObserver()],
    routes: [
      GoRoute(
        path: "/",
        name: welcome,
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const WelcomePage(),
      ),
      GoRoute(
          path: "/login",
          name: login,
          parentNavigatorKey: rootNavigatorKey,
          builder: (context, state) => const LoginPage()),
      GoRoute(
          path: "/register",
          name: register,
          parentNavigatorKey: rootNavigatorKey,
          builder: (context, state) {
            return const RegisterPage();
          }),
      GoRoute(
        path: "/forgot-password",
        name: forgotPassword,
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (context, state) => const MaterialPage(
            fullscreenDialog: true, child: ForgotPasswordPage()),
      ),
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return NavigationBarController(
              navigationShell: navigationShell,
            );
          },
          branches: [
            StatefulShellBranch(navigatorKey: shellHomeNavigatorKey, routes: [
              GoRoute(
                  path: "/home",
                  name: home,
                  parentNavigatorKey: shellHomeNavigatorKey,
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: HomePage()),
                  routes: [
                    GoRoute(
                      path: "validate-user",
                      name: validateUser,
                      parentNavigatorKey: rootNavigatorKey,
                      pageBuilder: (context, state) => const MaterialPage(
                          fullscreenDialog: true, child: ValidateUserPage()),
                      builder: (context, state) => const ValidateUserPage(),
                    ),
                  ]),
            ]),
            StatefulShellBranch(navigatorKey: shellSearchNavigatorKey, routes: [
              GoRoute(
                  path: "/search",
                  name: search,
                  parentNavigatorKey: shellSearchNavigatorKey,
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: SearchPage()),
                  routes: [
                    GoRoute(
                      path: "activities",
                      name: activities,
                      parentNavigatorKey: shellSearchNavigatorKey,
                      builder: (context, state) => const ActivitiesPage(),
                    ),
                  ]),
            ]),
            StatefulShellBranch(
                navigatorKey: shellNotificationsNavigatorKey,
                routes: [
                  GoRoute(
                    path: '/notifications',
                    name: notifications,
                    parentNavigatorKey: shellNotificationsNavigatorKey,
                    pageBuilder: (context, state) =>
                        const NoTransitionPage(child: NotificationsPage()),
                  ),
                ]),
            StatefulShellBranch(
                navigatorKey: shellProfileNavigatorKey,
                routes: [
                  GoRoute(
                      path: '/profile',
                      name: profile,
                      parentNavigatorKey: shellProfileNavigatorKey,
                      pageBuilder: (context, state) =>
                          const NoTransitionPage(child: ProfilePage()),
                      routes: [
                        GoRoute(
                          path: 'settings',
                          name: settings,
                          parentNavigatorKey: rootNavigatorKey,
                          builder: (context, state) => const SettingsPage(),
                        ),
                      ]),
                ]),
          ])
    ],
    redirect: (context, state) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final isAuthenticated = prefs.getString("token") != null;
      final location = state.matchedLocation;

      if (isAuthenticated &&
          (location == "/" ||
              location == "/login" ||
              location == "/register" ||
              location == "/forgot-password")) {
        return "/home";
      } else if (!isAuthenticated &&
          location != "/" &&
          location != "/login" &&
          location != "/register" &&
          location != "/forgot-password") {
        return "/";
      }

      return null;
    },
    errorBuilder: (context, state) => const NotFoundPage(),
  );
}
