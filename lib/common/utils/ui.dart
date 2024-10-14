import 'package:flutter_screenutil/flutter_screenutil.dart';

// UI工具

double duSetWidth(double width) {
  return ScreenUtil().setWidth(width);
}

double duSetHeight(double height) {
  return ScreenUtil().setHeight(height);
}

double duSetFontSize(double fontsize) {
  return ScreenUtil().setSp(fontsize);
}
