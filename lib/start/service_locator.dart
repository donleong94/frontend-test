import 'package:frontend_test/core/constant/value_constant.dart';
import 'package:frontend_test/network/misc/dio_client.dart';
import 'package:frontend_test/network/repository/post_repository.dart';
import 'package:frontend_test/network/service/post_service.dart';
import 'package:frontend_test/start/app_router.dart';
import 'package:frontend_test/start/build_environment.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> startup() async {
  // General

  sl.registerSingleton<AppRouter>(AppRouter());

  // Dio - Base + Interceptor + Logger

  sl.registerSingleton<DioClient>(
    DioClient.init(env!.baseUrl),
    instanceName: ValueConstants.postClient,
  );

  // Service

  sl.registerSingleton<PostService>(PostService(sl<DioClient>(instanceName: ValueConstants.postClient)));

  // Repository

  sl.registerSingleton<PostRepository>(PostRepository(sl<PostService>()));
}
