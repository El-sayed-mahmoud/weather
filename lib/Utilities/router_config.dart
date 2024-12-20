import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../Modules/AppearanceLayoutScreens/appearance_screen.dart';
import '../Modules/Home/home_screen.dart';
import '../Modules/Splash/splash_screen.dart';
import '../Modules/Weather/weather_screen.dart';
BuildContext? get currentContext_ => GoRouterConfig.router.routerDelegate.navigatorKey.currentContext;

class GoRouterConfig{
  static GoRouter get router => _router;
  static final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: SplashScreen.routeName,
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child: const SplashScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        path: AppearanceScreen.routeName,
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child: const AppearanceScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: HomeScreen.routeName,
        path: "/${HomeScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child: const HomeScreen(),
          );
        },
        routes:  <RouteBase>[
          GoRoute(
            name: WeatherScreen.routeName,
            path: WeatherScreen.routeName,
            pageBuilder: (_, GoRouterState state) {
              return getCustomTransitionPage(
                state: state,
                child:  WeatherScreen(
                  selectedDate:state.extra as DateTime,
                ),
              );
            },
            routes: const <RouteBase>[],
          ),

        ],
      ),
    ],
    // redirect: (BuildContext context, GoRouterState state) {
    //   if(!SharedPref.isLogin()) return LoginScreen.routeName;
    //   if(state.matchedLocation == LoginScreen.routeName && SharedPref.isLogin()) return "/${HomeScreen.routeName}";
    //
    //   if(state.matchedLocation == OtpScreen.routeName && state.extra == null){
    //     return ForgotPasswordScreen.routeName;
    //   }
    // },
  );

  static CustomTransitionPage getCustomTransitionPage({required GoRouterState state, required Widget child}){
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        );
      },
    );
  }
}





