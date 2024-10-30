import 'package:flutter/material.dart';
import 'package:flutter_template/common/index.dart';
import 'package:flutter_template/common/utils/date.dart';
import 'package:flutter_template/pages/main/controller.dart';
import 'package:flutter_template/pages/main/widgets/ad.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsListWidget extends GetView<MainController> {
  const NewsListWidget({super.key});

  Widget _buildListItem(NewsItem item) {
    return Container(
      height: 161.w,
      padding: EdgeInsets.all(20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 图
          InkWell(
            onTap: () {},
            child: SizedBox(
              width: 121.w,
              height: 121.w,
              child: netImageCached(
                item.thumbnail ?? "",
                width: 121.w,
                height: 121.w,
              ),
            ),
          ),
          // 右侧
          SizedBox(
            width: 194.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // 作者
                Container(
                  margin: const EdgeInsets.all(0),
                  child: Text(
                    item.author ?? "",
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.normal,
                      color: AppColor.thirdElementText,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                // 标题
                InkWell(
                  onTap: () {
                    // ExtendedNavigator.rootNavigator.pushNamed(
                    //   Routes.detailsPageRoute,
                    //   arguments: DetailsPageArguments(item: item),
                    // );
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10.w),
                    child: Text(
                      item.title ?? "",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryText,
                        fontSize: 16.sp,
                        overflow: TextOverflow.clip,
                      ),
                      overflow: TextOverflow.clip,
                      maxLines: 3,
                    ),
                  ),
                ),
                // Spacer
                const Spacer(),
                // 一行 3 列
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // 分类
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 60.w,
                      ),
                      child: Text(
                        item.category ?? "",
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontWeight: FontWeight.normal,
                          color: AppColor.secondaryElementText,
                          fontSize: 14.sp,
                        ),
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                      ),
                    ),
                    // 添加时间
                    Container(
                      width: 15.w,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 100.w,
                      ),
                      child: Text(
                        '• ${dateFormat(item.addtime ?? DateTime(0))}',
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontWeight: FontWeight.normal,
                          color: AppColor.thirdElementText,
                          fontSize: 14.sp,
                        ),
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                      ),
                    ),
                    // 更多
                    const Spacer(),
                    InkWell(
                      child: const Icon(
                        Icons.more_horiz,
                        color: AppColors.primaryText,
                        size: 24,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.state.newsPageList == null
        ? Container()
        : Column(
            children: controller.state.newsPageList.items.map<Widget>((item) {
              // 新闻行
              List<Widget> widgets = <Widget>[
                _buildListItem(item),
                const Divider(height: 1),
              ];

              // 每 5 条 显示广告
              int index = controller.state.newsPageList.items.indexOf(item);
              if (((index + 1) % 5) == 0) {
                widgets.addAll(<Widget>[
                  const AdWidget(),
                  const Divider(height: 1),
                ]);
              }

              // 返回
              return Column(
                children: widgets,
              );
            }).toList(),
          ));
  }
}
