import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend_test/core/util/general_utils.dart';
import 'package:frontend_test/core/widget/comment_item_list_widget.dart';
import 'package:frontend_test/feature/bloc_cubit/individual_post_cubit.dart';
import 'package:loader_overlay/loader_overlay.dart';

class IndividualPostView extends StatefulWidget {
  const IndividualPostView({
    super.key,
    required this.individualPostCubit,
    required this.postId,
  });

  final IndividualPostCubit individualPostCubit;
  final int postId;

  @override
  State<IndividualPostView> createState() => _IndividualPostViewState();
}

class _IndividualPostViewState extends State<IndividualPostView> {
  @override
  void initState() {
    widget.individualPostCubit.getCurrentPost(widget.postId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<IndividualPostCubit, IndividualPostState>(
      bloc: widget.individualPostCubit,
      listener: (context, state) {
        if (state.status.isLoading()) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }
      },
      builder: (context, state) {
        if (state.status.isSuccess()) {
          final postItem = state.postMainItem;
          final title = postItem?.title ?? "";
          final body = postItem?.body ?? "";

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title.boldText(
                      fontSize: 18.sp,
                    ),
                    4.ph,
                    body.regularText(
                      fontSize: 14.sp,
                    ),
                    16.ph,
                    Divider(
                      height: 1.h,
                      color: Colors.blueGrey,
                    ),
                    16.ph,
                    "Comment List".mediumText(
                      fontSize: 16.sp,
                    ),
                    16.ph,
                    Divider(
                      height: 1.h,
                      color: Colors.blueGrey,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    widget.individualPostCubit.getCurrentPost(widget.postId);
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: Column(
                        children: [
                          ...state.filteredCommentList.mapIndexed(
                            (index, item) {
                              return CommentItemListWidget(itemData: item);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
