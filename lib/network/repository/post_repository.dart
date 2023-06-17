import 'package:frontend_test/core/util/general_utils.dart';
import 'package:frontend_test/model/comment_main_item.dart';
import 'package:frontend_test/model/post_main_item.dart';
import 'package:frontend_test/network/service/post_service.dart';

class PostRepository {
  PostRepository(this.postDataSource);

  final PostDataSource postDataSource;

  Future getAllPosts() async {
    try {
      final response = await postDataSource.getAllPosts() as List? ?? [];

      if (response.isNotEmpty) {
        final List<PostMainItem> dataList = response.map((e) => PostMainItem.fromJson(e)).toList();
        return dataList;
      } else {
        return <PostMainItem>[];
      }
    } catch (e) {
      return <PostMainItem>[];
    }
  }

  Future getIndividualPost({
    required int postId,
  }) async {
    try {
      final response = await postDataSource.getIndividualPost(postId: postId) as Hmap? ?? {};
      final PostMainItem data = PostMainItem.fromJson(response);
      return data;
    } catch (e) {
      return null;
    }
  }

  Future getPostComments({
    required int postId,
  }) async {
    try {
      final response = await postDataSource.getPostComments(postId: postId) as List? ?? [];

      if (response.isNotEmpty) {
        final List<CommentMainItem> dataList = response.map((e) => CommentMainItem.fromJson(e)).toList();
        return dataList;
      } else {
        return <CommentMainItem>[];
      }
    } catch (e) {
      return <CommentMainItem>[];
    }
  }
}
