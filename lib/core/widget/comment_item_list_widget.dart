import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend_test/core/util/general_utils.dart';
import 'package:frontend_test/model/comment_main_item.dart';

class CommentItemListWidget extends StatelessWidget {
  const CommentItemListWidget({
    super.key,
    required this.itemData,
  });

  final CommentMainItem itemData;

  @override
  Widget build(BuildContext context) {
    final name = itemData.name ?? "";
    final email = itemData.email ?? "";
    final body = itemData.body ?? "";

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.ph,
        name.boldText(
          fontSize: 18.sp,
          maxLines: 1,
          textOverflow: TextOverflow.ellipsis,
        ),
        4.ph,
        email.boldText(
          fontSize: 14.sp,
          maxLines: 1,
          textOverflow: TextOverflow.ellipsis,
        ),
        4.ph,
        body.regularText(
          fontSize: 14.sp,
        ),
        20.ph,
        Divider(
          height: 1.h,
          color: Colors.blueGrey,
        ),
      ],
    );
  }
}
