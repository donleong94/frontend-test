import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_test/model/post_main_item.dart';
import 'package:frontend_test/network/misc/general_status.dart';
import 'package:frontend_test/network/repository/post_repository.dart';

part 'all_posts_state.dart';

class AllPostsCubit extends Cubit<AllPostsState> {
  AllPostsCubit({
    required this.postRepository,
  }) : super(const AllPostsState());

  final PostRepository postRepository;

  getAllPosts() async {
    emit(
      state.copyWith(
        status: GeneralStatus.loading,
      ),
    );

    final response = await postRepository.getAllPosts();

    if (response is List<PostMainItem>) {
      emit(
        state.copyWith(
          status: GeneralStatus.success,
          postList: response,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: GeneralStatus.success,
          postList: [],
        ),
      );
    }
  }
}
