import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend_test/core/util/general_utils.dart';
import 'package:frontend_test/core/widget/custom_app_bar_widget.dart';
import 'package:frontend_test/core/widget/text_form_widget.dart';
import 'package:frontend_test/feature/bloc_cubit/individual_post_cubit.dart';
import 'package:frontend_test/feature/view/individual_post_view.dart';
import 'package:frontend_test/network/repository/post_repository.dart';
import 'package:frontend_test/start/service_locator.dart';
import 'package:loader_overlay/loader_overlay.dart';

@RoutePage()
class IndividualPostScreen extends StatefulWidget {
  const IndividualPostScreen({
    super.key,
    required this.postId,
  });

  final int postId;

  @override
  State<IndividualPostScreen> createState() => _IndividualPostScreenState();
}

class _IndividualPostScreenState extends State<IndividualPostScreen> {
  final IndividualPostCubit individualPostCubit = IndividualPostCubit(
    postRepository: sl<PostRepository>(),
  );

  String _nameText = "";
  String _emailText = "";
  String _bodyText = "";

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: Scaffold(
        appBar: CustomAppBarWidget(
          titleText: "Current Post",
          hasLeading: true,
          isCenterTitle: true,
          actions: [
            GestureDetector(
              onTap: () {
                filterBottomSheet(
                  context: context,
                  nameText: _nameText,
                  emailText: _emailText,
                  bodyText: _bodyText,
                  callback: (nameResult, emailResult, bodyResult) {
                    _nameText = nameResult;
                    _emailText = emailResult;
                    _bodyText = bodyResult;

                    individualPostCubit.filterList(
                      name: nameResult,
                      email: emailResult,
                      body: bodyResult,
                    );
                  },
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 8.h),
                child: "Filter".mediumText(
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ),
        body: IndividualPostView(
          individualPostCubit: individualPostCubit,
          postId: widget.postId,
        ),
      ),
    );
  }
}

Future<void> filterBottomSheet({
  required BuildContext context,
  required String nameText,
  required String emailText,
  required String bodyText,
  required Function(String, String, String) callback,
}) async {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return _FilterBody(
        nameText: nameText,
        emailText: emailText,
        bodyText: bodyText,
        callback: callback,
      );
    },
  );
}

class _FilterBody extends HookWidget {
  const _FilterBody({
    required this.nameText,
    required this.emailText,
    required this.bodyText,
    required this.callback,
  });

  final String nameText;
  final String emailText;
  final String bodyText;
  final Function(String, String, String) callback;

  @override
  Widget build(BuildContext context) {
    final nameTextCon = useTextEditingController(text: nameText);
    final emailTextCon = TextEditingController(text: emailText);
    final bodyTextCon = TextEditingController(text: bodyText);

    return Container(
      height: ScreenUtil().screenHeight * 0.5,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 12.h),
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 56.h,
              height: 4.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
            ),
          ),
          20.ph,
          TextFormWidget(
            label: "Name",
            controller: nameTextCon,
          ),
          12.ph,
          TextFormWidget(
            label: "Email",
            controller: emailTextCon,
          ),
          12.ph,
          TextFormWidget(
            label: "Body",
            controller: bodyTextCon,
          ),
          const Spacer(),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                callback(
                  nameTextCon.text,
                  emailTextCon.text,
                  bodyTextCon.text,
                );

                Navigator.pop(context);
              },
              child: "Submit".mediumText(
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
