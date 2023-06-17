import 'package:auto_route/auto_route.dart';
import 'package:frontend_test/feature/main_home_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Screen,Route")
class AppRouter extends _$AppRouter {
  AppRouter() : super();

  @override
  RouteType get defaultRouteType {
    return const RouteType.material();
  }

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: MainHomeRoute.page, path: "/mainHome"),
  ];
}
