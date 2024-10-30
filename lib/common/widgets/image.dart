import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/common/index.dart';

Widget netImageCached(String url,
        {double width = 48, double height = 48, EdgeInsetsGeometry? margin}) =>
    CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (ctx, imp) => Container(
              height: height.h,
              width: width.w,
              margin: margin,
              decoration: BoxDecoration(
                  borderRadius: Radii.k6pxRadius,
                  image: DecorationImage(image: imp, fit: BoxFit.cover)),
            ),
        placeholder: (ctx, url) => Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            ),
        errorWidget: (ctx, url, error) => Container(
              height: height.h / 2,
              width: width.w,
              margin: margin,
              alignment: Alignment.center,
              color: Colors.grey.withAlpha(50),
              child: Icon(
                Icons.broken_image,
                color: Colors.grey,
                size: 50.sp,
              ),
            ));
