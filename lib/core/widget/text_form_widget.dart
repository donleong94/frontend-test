import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormWidget extends HookWidget {
  /// [HookWidget] - used to handle this widget state status
  const TextFormWidget({
    super.key,
    this.controller,
    required this.label,
    this.hintText,
    this.textInputType,
  });

  final TextEditingController? controller;
  final String label;
  final String? hintText;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    final focus = FocusScope.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.h),
        color: const Color.fromARGB(255, 231, 230, 230),
      ),
      padding: EdgeInsets.fromLTRB(15.h, 10.h, 15.h, 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: TextFormField(
                  controller: controller,
                  focusNode: focusNode,
                  keyboardType: textInputType,
                  onEditingComplete: () => focus.nextFocus(),
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.sp,
                    ),
                    isCollapsed: true,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    filled: true,
                    fillColor: const Color.fromARGB(255, 231, 230, 230),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
