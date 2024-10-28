import 'package:flutter/material.dart';
import 'package:flutter_template/common/index.dart';
import 'package:flutter_template/pages/account/index.dart';
import 'package:flutter_template/pages/bookmarks/index.dart';
import 'package:flutter_template/pages/category/index.dart';
import 'package:flutter_template/pages/main/index.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage>
    with SingleTickerProviderStateMixin {
  // 当前 tab 页码
  int _page = 0;
  // tab 页标题
  final List<String> _tabTitles = [
    'Welcome',
    'Cagegory',
    'Bookmarks',
    'Account'
  ];
  // 页控制器
  late PageController _pageController;

  // 底部导航项目
  final List<BottomNavigationBarItem> _bottomTabs = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(
        Iconfont.home,
        color: AppColor.tabBarElement,
      ),
      activeIcon: Icon(
        Iconfont.home,
        color: AppColor.secondaryElementText,
      ),
      label: 'main',
      backgroundColor: AppColor.primaryBackground,
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Iconfont.grid,
        color: AppColor.tabBarElement,
      ),
      activeIcon: Icon(
        Iconfont.grid,
        color: AppColor.secondaryElementText,
      ),
      label: ('category'),
      backgroundColor: AppColor.primaryBackground,
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Iconfont.tag,
        color: AppColor.tabBarElement,
      ),
      activeIcon: Icon(
        Iconfont.tag,
        color: AppColor.secondaryElementText,
      ),
      label: ('tag'),
      backgroundColor: AppColor.primaryBackground,
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Iconfont.me,
        color: AppColor.tabBarElement,
      ),
      activeIcon: Icon(
        Iconfont.me,
        color: AppColor.secondaryElementText,
      ),
      label: ('my'),
      backgroundColor: AppColor.primaryBackground,
    ),
  ];

  // tab栏动画
  void _handleNavBarTap(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  // tab栏页码切换
  void _handlePageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _page);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // 顶部导航
  AppBar _buildAppBar() {
    return transparentAppBar(
        context: context,
        title: Text(
          _tabTitles[_page],
          style: TextStyle(
            color: AppColor.primaryText,
            fontFamily: 'Montserrat',
            fontSize: duSetFontSize(18.0),
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColor.primaryText,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              color: AppColor.primaryText,
            ),
            onPressed: () {},
          )
        ]);
  }

  // 内容页
  Widget _buildPageView() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _pageController,
      onPageChanged: _handlePageChanged,
      children: const <Widget>[
        MainPage(),
        CategoryPage(),
        BookmarksPage(),
        AccountPage(),
      ],
    );
  }

  // 底部导航
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: _bottomTabs,
      currentIndex: _page,
      // fixedColor: AppColor.primaryElement,
      type: BottomNavigationBarType.fixed,
      onTap: _handleNavBarTap,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
