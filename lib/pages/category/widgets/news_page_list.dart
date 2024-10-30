import 'package:flutter/material.dart';
import 'package:flutter_template/common/utils/date.dart';
import 'package:get/get.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_template/common/index.dart';
import '../controller.dart';

class NewsPageList extends StatefulWidget {
  const NewsPageList({super.key});

  @override
  State<NewsPageList> createState() => _NewsPageListState();
}

class _NewsPageListState extends State<NewsPageList>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return GetX<CategoryController>(
      builder: (controller) {
        return EasyRefresh(
          onRefresh: controller.onRefresh,
          onLoad: controller.onLoading,
          controller: controller.refeshCtr,
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  vertical: 0.w,
                  horizontal: 0.w,
                ),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (content, index) {
                      var item = controller.state.newsList[index];
                      return newsListItem(item);
                    },
                    childCount: controller.state.newsList.length,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

Widget newsListItem(NewsItem item) {
  return Container(
    height: 161.h,
    padding: EdgeInsets.all(20.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // 图
        InkWell(
          onTap: () {
            // ExtendedNavigator.rootNavigator.pushNamed(
            //   Routes.detailsPageRoute,
            //   arguments: DetailsPageArguments(item: item),
            // );
          },
          child: netImageCached(
            item.thumbnail ?? "",
            width: 121.w,
            height: 121.w,
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
                    height: 1,
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
                  margin: EdgeInsets.only(top: 10.h),
                  child: Text(
                    item.title ?? "",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryText,
                      fontSize: 16.sp,
                      height: 1,
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
                        height: 1,
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
                        height: 1,
                      ),
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                    ),
                  ),
                  // 更多
                  const Spacer(),
                  InkWell(
                    child: Icon(
                      Icons.more_horiz,
                      color: AppColors.primaryText,
                      size: 24.sp,
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
