import 'package:flutter/material.dart';
import 'package:flutter_template/common/api/news.dart';
import 'package:flutter_template/common/index.dart';
import 'package:flutter_template/pages/main/categories_widget.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late NewsPageListResponseEntity _newsPageList = NewsPageListResponseEntity(
      counts: 0, pagesize: 0, pages: 1, page: 1, items: []);
  // 新闻翻页
  late NewsRecommendResponseEntity _newsRecommend = NewsRecommendResponseEntity(
      thumbnail: '',
      title: '',
      category: '',
      addtime: DateTime.now(),
      author: '',
      url: '',
      id: '');
  // 新闻推荐
  late List<CategoryResponseEntity> _categories = [];
  // 分类
  late List<ChannelResponseEntity> _channels = [];
  // 频道
  late Rx<String> _selCategoryCode = ''.obs;

  @override
  void initState() {
    _loadAllData();
    super.initState();
  }

  // 读取所有数据
  _loadAllData() async {
    _categories = await NewsAPI.categories();
    _channels = await NewsAPI.channels();
    _newsRecommend = await NewsAPI.newsRecommend();
    _newsPageList = await NewsAPI.newsPageList();

    _selCategoryCode.value =
        _categories.isNotEmpty ? _categories.first.code : '';
  }

  // 分类菜单
  Widget _buildCategories() {
    return Obx(() => newsCategoriesWidget(
          categories: _categories,
          selCategoryCode: _selCategoryCode.value,
          onTap: (CategoryResponseEntity item) {
            _selCategoryCode.value = item.code;
          },
        ));
  }

  // 推荐阅读
  Widget _buildRecommend() {
    return Container(
      height: duSetHeight(490),
      color: Colors.amber,
    );
  }

  // 频道
  Widget _buildChannels() {
    return Container(
      height: duSetHeight(137),
      color: Colors.blueAccent,
    );
  }

  // 新闻列表
  Widget _buildNewsList() {
    return Container(
      height: duSetHeight(161 * 5 + 100.0),
      color: Colors.purple,
    );
  }

  // ad 广告条
  Widget _buildEmailSubscribe() {
    return Container(
      height: duSetHeight(259),
      color: Colors.brown,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildCategories(),
          _buildRecommend(),
          _buildChannels(),
          _buildNewsList(),
          _buildEmailSubscribe(),
        ],
      ),
    );
  }
}
