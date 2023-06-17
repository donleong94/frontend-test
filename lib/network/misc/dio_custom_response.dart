import 'package:dio/dio.dart';
import 'package:frontend_test/core/util/general_utils.dart';

class DioCustomResponse {
  DioCustomResponse({
    required this.response,
    this.url,
  });

  final Response<dynamic> response;
  final String? url;

  Hmap? get jmapData {
    return response.data as Hmap?;
  }
}
