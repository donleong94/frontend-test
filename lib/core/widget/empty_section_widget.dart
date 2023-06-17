import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend_test/core/util/general_utils.dart';

class EmptySectionWidget extends StatelessWidget {
  const EmptySectionWidget({
    super.key,
    required this.title,
    this.verticalPadding,
  });

  final String title;
  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: verticalPadding ?? ScreenUtil().screenHeight * 0.4,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          title.mediumText(
            fontSize: 16.sp,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
