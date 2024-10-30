import 'package:flutter_template/common/index.dart';

/// 新闻
class NewsAPI {
  /// 翻页
  static Future<NewsPageListResponseEntity> newsPageList(
      {NewsPageListRequestEntity? params}) async {
    var response = await XHttp.getInstance().get('/news', params?.toJson());
    return NewsPageListResponseEntity.fromJson(response.data);
  }

  /// 推荐
  static Future<NewsItem> newsRecommend(
      {NewsRecommendRequestEntity? params}) async {
    var response = await XHttp.getInstance().get('/news/recommend', params);
    return NewsItem.fromJson(response.data);
  }

  /// 分类
  static Future<List<CategoryResponseEntity>> categories() async {
    var response = await XHttp.getInstance().get('/categories');
    return response.data
        .map<CategoryResponseEntity>(
            (item) => CategoryResponseEntity.fromJson(item))
        .toList();
  }

  /// 频道
  static Future<List<ChannelResponseEntity>> channels() async {
    var response = await XHttp.getInstance().get('/channels');
    return response.data
        .map<ChannelResponseEntity>(
            (item) => ChannelResponseEntity.fromJson(item))
        .toList();
  }

  /// 标签列表
  static Future<List<TagResponseEntity>> tags(
      {required TagRequestEntity params}) async {
    var response = await XHttp.getInstance().get('/tags', params);
    return response.data
        .map<TagResponseEntity>((item) => TagResponseEntity.fromJson(item))
        .toList();
  }
}
