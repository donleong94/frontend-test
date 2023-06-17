import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stream_transform/stream_transform.dart' show RateLimit;

typedef Hmap = Map<String, dynamic>;

class GeneralUtils {
  // For bloc handling
  static EventTransformer<E> throttleDroppable<E>() {
    const throttleDuration = Duration(milliseconds: 200);

    return (events, mapper) {
      return droppable<E>().call(events.throttle(throttleDuration), mapper);
    };
  }

  static setupDelayTimer({
    int durationMs = 250,
    required Function() callback,
  }) {
    Timer(
      Duration(milliseconds: durationMs),
      callback,
    );
  }
}

// For empty spaces
extension EmptyPadding on num {
  // Empty sized box with custom height
  SizedBox get ph => SizedBox(height: toDouble());

  // Empty sized box for custom width
  SizedBox get pw => SizedBox(width: toDouble());

  // Sliver empty space
  SliverToBoxAdapter get sph {
    return SliverToBoxAdapter(
      child: SizedBox(height: toDouble()),
    );
  }
}

extension CustomText on String {
  Widget textGeneralConfig({
    double? fontSize,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextDecoration? textDecoration,
    FontWeight? fontWeight,
    double? letterSpacing,
    TextOverflow? textOverflow,
  }) {
    return Text(
      toString(),
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? Colors.grey,
        letterSpacing: letterSpacing,
        decoration: textDecoration,
        overflow: textOverflow,
      ),
    );
  }

  Widget boldText({
    double? fontSize,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextDecoration? textDecoration,
    TextOverflow? textOverflow,
  }) {
    return textGeneralConfig(
      color: color ?? Colors.black,
      fontSize: fontSize ?? 13.sp,
      textAlign: textAlign,
      maxLines: maxLines,
      textDecoration: textDecoration,
      fontWeight: FontWeight.w700,
      textOverflow: textOverflow,
    );
  }

  Widget mediumText({
    double? fontSize,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextDecoration? textDecoration,
    TextOverflow? textOverflow,
  }) {
    return textGeneralConfig(
      color: color ?? Colors.black,
      fontSize: fontSize ?? 13.sp,
      textAlign: textAlign,
      maxLines: maxLines,
      textDecoration: textDecoration,
      fontWeight: FontWeight.w500,
      textOverflow: textOverflow,
    );
  }

  Widget regularText({
    double? fontSize,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextDecoration? textDecoration,
    TextOverflow? textOverflow,
  }) {
    return textGeneralConfig(
      color: color ?? Colors.black,
      fontSize: fontSize ?? 13.sp,
      textAlign: textAlign,
      maxLines: maxLines,
      textDecoration: textDecoration,
      fontWeight: FontWeight.w300,
      textOverflow: textOverflow,
    );
  }
}
