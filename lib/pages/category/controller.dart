import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter_template/common/api/news.dart';
import 'package:flutter_template/common/index.dart';
import 'package:flutter_template/common/models/news.dart';
import 'package:get/get.dart';

import 'index.dart';

class CategoryController extends GetxController {
  CategoryController();

  final state = CategoryState();

  EasyRefreshController refeshCtr = EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: true,
  );

  /// 成员变量
  String categoryCode = '';
  int curPage = 1;
  int pageSize = 20;
  int total = 20;

  // 拉取数据
  Future<void> fetchNewsList({bool isRefresh = false}) async {
    var result = await NewsAPI.newsPageList(
      params: NewsPageListRequestEntity(
        categoryCode: categoryCode,
        pageNum: curPage + 1,
        pageSize: pageSize,
      ),
    );

    if (isRefresh == true) {
      curPage = 1;
      total = result.counts!;
      state.newsList.clear();
    } else {
      curPage++;
    }

    state.newsList.addAll(result.items!);
  }

  void onRefresh() {
    fetchNewsList(isRefresh: true).then((_) {
      refeshCtr.finishRefresh();
    }).catchError((e) {
      utilLogger.e(e);
      refeshCtr.finishRefresh(IndicatorResult.fail);
    });
  }

  void onLoading() {
    if (state.newsList.length < total) {
      fetchNewsList().then((_) {
        refeshCtr.finishLoad();
      }).catchError((e) {
        utilLogger.e(e);
        refeshCtr.finishLoad(IndicatorResult.fail);
      });
    } else {
      refeshCtr.finishLoad(IndicatorResult.noMore);
    }
  }

  // 方法

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    onRefresh();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
    refeshCtr.dispose();
  }
}
