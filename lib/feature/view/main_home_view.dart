import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend_test/core/widget/empty_section_widget.dart';
import 'package:frontend_test/core/widget/post_item_list_widget.dart';
import 'package:frontend_test/feature/bloc_cubit/all_posts_cubit.dart';
import 'package:frontend_test/network/repository/post_repository.dart';
import 'package:frontend_test/start/service_locator.dart';

class MainHomeView extends StatefulWidget {
  const MainHomeView({super.key});

  @override
  State<MainHomeView> createState() => _MainHomeViewState();
}

class _MainHomeViewState extends State<MainHomeView> {
  final AllPostsCubit allPostsCubit = AllPostsCubit(
    postRepository: sl<PostRepository>(),
  );

  @override
  void initState() {
    allPostsCubit.getAllPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        allPostsCubit.getAllPosts();
      },
      child: BlocConsumer<AllPostsCubit, AllPostsState>(
        bloc: allPostsCubit,
        listener: (context, state) {},
        builder: (context, state) {
          Widget contentWidget = Container();

          if (state.postList.isEmpty) {
            contentWidget = SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  EmptySectionWidget(
                    title: "There is no item.",
                    verticalPadding: ScreenUtil().screenHeight * 0.25,
                  ),
                ],
              ),
            );
          } else {
            contentWidget = CustomScrollView(
              primary: false,
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 4.h),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (index >= state.postList.length) {
                          return const SizedBox.shrink();
                        } else {
                          return PostItemListWidget(
                            itemData: state.postList[index],
                          );
                        }
                      },
                      childCount: state.postList.length,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 16.h,
                      crossAxisCount: 1,
                      childAspectRatio: 6 / 2.2,
                    ),
                  ),
                ),
              ],
            );
          }

          return contentWidget;
        },
      ),
    );
  }
}
