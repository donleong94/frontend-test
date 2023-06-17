import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend_test/core/util/general_utils.dart';
import 'package:frontend_test/model/post_main_item.dart';

class PostItemListWidget extends StatelessWidget {
  const PostItemListWidget({
    super.key,
    required this.itemData,
  });

  final PostMainItem itemData;

  @override
  Widget build(BuildContext context) {
    final title = itemData.title ?? "";
    final body = itemData.body ?? "";

    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          title.boldText(
            fontSize: 18.sp,
            maxLines: 1,
            textOverflow: TextOverflow.ellipsis,
          ),
          4.ph,
          body.mediumText(
            fontSize: 14.sp,
            maxLines: 3,
            textOverflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          Divider(
            height: 1.h,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
