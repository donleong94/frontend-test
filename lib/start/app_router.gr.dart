// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    IndividualPostRoute.name: (routeData) {
      final args = routeData.argsAs<IndividualPostRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: IndividualPostScreen(
          key: args.key,
          postId: args.postId,
        ),
      );
    },
    MainHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainHomeScreen(),
      );
    },
  };
}

/// generated route for
/// [IndividualPostScreen]
class IndividualPostRoute extends PageRouteInfo<IndividualPostRouteArgs> {
  IndividualPostRoute({
    Key? key,
    required int postId,
    List<PageRouteInfo>? children,
  }) : super(
          IndividualPostRoute.name,
          args: IndividualPostRouteArgs(
            key: key,
            postId: postId,
          ),
          initialChildren: children,
        );

  static const String name = 'IndividualPostRoute';

  static const PageInfo<IndividualPostRouteArgs> page =
      PageInfo<IndividualPostRouteArgs>(name);
}

class IndividualPostRouteArgs {
  const IndividualPostRouteArgs({
    this.key,
    required this.postId,
  });

  final Key? key;

  final int postId;

  @override
  String toString() {
    return 'IndividualPostRouteArgs{key: $key, postId: $postId}';
  }
}

/// generated route for
/// [MainHomeScreen]
class MainHomeRoute extends PageRouteInfo<void> {
  const MainHomeRoute({List<PageRouteInfo>? children})
      : super(
          MainHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
