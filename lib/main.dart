import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend_test/app.dart';
import 'package:frontend_test/core/constant/url_constant.dart';
import 'package:frontend_test/start/build_environment.dart';
import 'package:frontend_test/start/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  BuildEnvironment.init(
    baseUrl: UrlConstants.baseUrl,
  );

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await ScreenUtil.ensureScreenSize();
  await startup();

  runApp(const App());
}
