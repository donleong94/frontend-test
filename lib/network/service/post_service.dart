import 'package:frontend_test/network/misc/dio_client.dart';

abstract class PostDataSource {
  Future<dynamic> getAllPosts();

  Future<dynamic> getIndividualPost({
    required int postId,
  });

  Future<dynamic> getPostComments({
    required int postId,
  });
}

class PostService implements PostDataSource {
  PostService(this.client);

  final DioClient client;

  @override
  Future<dynamic> getAllPosts() async {
    final response = await client.get("posts");
    return response.response.data;
  }

  @override
  Future<dynamic> getIndividualPost({
    required int postId,
  }) async {
    final response = await client.get("posts/$postId");
    return response.response.data;
  }

  @override
  Future<dynamic> getPostComments({
    required int postId,
  }) async {
    final response = await client.get("comments?postId=$postId");
    return response.response.data;
  }
}
