part of 'individual_post_cubit.dart';

class IndividualPostState extends Equatable {
  const IndividualPostState({
    this.isFirstLoading = true,
    this.status = GeneralStatus.init,
    this.postMainItem,
    this.allCommentList = const [],
    this.filteredCommentList = const [],
  });

  final bool isFirstLoading;
  final GeneralStatus status;
  final PostMainItem? postMainItem;
  final List<CommentMainItem> allCommentList;
  final List<CommentMainItem> filteredCommentList;

  IndividualPostState copyWith({
    bool? isFirstLoading,
    GeneralStatus? status,
    PostMainItem? postMainItem,
    List<CommentMainItem>? allCommentList,
    List<CommentMainItem>? filteredCommentList,
  }) {
    return IndividualPostState(
      isFirstLoading: isFirstLoading ?? this.isFirstLoading,
      status: status ?? this.status,
      postMainItem: postMainItem ?? this.postMainItem,
      allCommentList: allCommentList ?? this.allCommentList,
      filteredCommentList: filteredCommentList ?? this.filteredCommentList,
    );
  }

  @override
  List<Object?> get props {
    return [
      isFirstLoading,
      status,
      postMainItem,
      allCommentList,
      filteredCommentList,
    ];
  }
}
