import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_test/model/comment_main_item.dart';
import 'package:frontend_test/model/post_main_item.dart';
import 'package:frontend_test/network/misc/general_status.dart';
import 'package:frontend_test/network/repository/post_repository.dart';

part 'individual_post_state.dart';

class IndividualPostCubit extends Cubit<IndividualPostState> {
  IndividualPostCubit({
    required this.postRepository,
  }) : super(const IndividualPostState());

  final PostRepository postRepository;

  void getCurrentPost(int postId) async {
    emit(
      state.copyWith(
        status: GeneralStatus.loading,
      ),
    );

    final postResponse = await postRepository.getIndividualPost(postId: postId);

    if (postResponse is PostMainItem) {
      final commentResponse = await postRepository.getPostComments(postId: postId);
      final isFirstLoading = state.isFirstLoading;

      if (commentResponse is List<CommentMainItem>) {
        emit(
          state.copyWith(
            isFirstLoading: false,
            status: GeneralStatus.success,
            postMainItem: postResponse,
            allCommentList: commentResponse,
            filteredCommentList: isFirstLoading ? commentResponse : state.filteredCommentList,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: GeneralStatus.success,
            postMainItem: postResponse,
            allCommentList: [],
            filteredCommentList: [],
          ),
        );
      }
    } else {
      emit(
        state.copyWith(
          status: GeneralStatus.error,
        ),
      );
    }
  }

  void filterList({
    required String name,
    required String email,
    required String body,
  }) async {
    if (name.isNotEmpty || email.isNotEmpty || body.isNotEmpty) {
      final fullList = state.allCommentList;

      final filteredList = fullList.where((item) {
        final itemName = (item.name ?? "").toLowerCase();
        final itemEmail = (item.email ?? "").toLowerCase();
        final itemBody = (item.body ?? "").toLowerCase();

        final nameMatch = name.isNotEmpty ? itemName.contains(name.toLowerCase()) : false;
        final emailMatch = email.isNotEmpty ? itemEmail.contains(email.toLowerCase()) : false;
        final bodyMatch = body.isNotEmpty ? itemBody.contains(body.toLowerCase()) : false;

        return nameMatch || emailMatch || bodyMatch;
      }).toList();

      emit(
        state.copyWith(
          status: GeneralStatus.success,
          filteredCommentList: filteredList,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: GeneralStatus.success,
          filteredCommentList: state.allCommentList,
        ),
      );
    }
  }
}
