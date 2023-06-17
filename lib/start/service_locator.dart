import 'package:frontend_test/start/app_router.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> startup() async {
  // General

  sl.registerSingleton<AppRouter>(AppRouter());
}