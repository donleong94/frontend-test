import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend_test/core/style/app_theme.dart';
import 'package:frontend_test/core/util/app_scrollbar_behaviour.dart';
import 'package:frontend_test/start/app_router.dart';
import 'package:frontend_test/start/service_locator.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppView();
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    final router = sl<AppRouter>();

    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerDelegate: AutoRouterDelegate(
              router,
              initialRoutes: [
                const MainHomeRoute(),
              ],
            ),
            routeInformationParser: router.defaultRouteParser(),
            title: "",
            theme: AppTheme.getTheme,
            builder: (ctx, child) {
              return ScrollConfiguration(
                behavior: AppScrollBehavior(),
                child: Theme(
                  data: AppTheme.getTheme,
                  child: child!,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
