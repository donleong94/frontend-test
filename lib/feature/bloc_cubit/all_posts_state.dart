part of 'all_posts_cubit.dart';

class AllPostsState extends Equatable {
  const AllPostsState({
    this.status = GeneralStatus.init,
    this.postList = const [],
  });

  final GeneralStatus status;
  final List<PostMainItem> postList;

  AllPostsState copyWith({
    GeneralStatus? status,
    List<PostMainItem>? postList,
  }) {
    return AllPostsState(
      status: status ?? this.status,
      postList: postList ?? this.postList,
    );
  }

  @override
  List<Object?> get props {
    return [
      status,
      postList,
    ];
  }
}
