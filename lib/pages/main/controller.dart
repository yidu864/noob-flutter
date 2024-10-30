import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_template/common/api/news.dart';
import 'package:flutter_template/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class MainController extends GetxController {
  MainController();

  final state = MainState();

  // 拉取数据
  Future<void> getMatchedData() async {
    try {
      state.categories = await NewsAPI.categories();
      state.newsRecommend = await NewsAPI.newsRecommend();
      state.channels = await NewsAPI.channels();
      state.newsPageList = await NewsAPI.newsPageList();
    } catch (e) {
      utilLogger.e(e);
      EasyLoading.showError('Main 初始化数据拉取失败');
    }
  }

  // 拉取推荐、新闻
  asyncLoadNewsData(
    categoryCode, {
    bool refresh = false,
  }) async {
    // TODO: 刷新没做，缓存没做
    state.selCategoryCode = categoryCode;
    state.newsRecommend = await NewsAPI.newsRecommend(
      params: NewsRecommendRequestEntity(categoryCode: categoryCode),
    );
    state.newsPageList = await NewsAPI.newsPageList(
      params: NewsPageListRequestEntity(categoryCode: categoryCode),
    );
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    getMatchedData();
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
  }
}
