import 'package:flutter/material.dart';
import 'package:flutter_template/pages/main/widgets/channels.dart';
import 'package:flutter_template/pages/main/widgets/news_letter.dart';
import 'package:flutter_template/pages/main/widgets/news_list.dart';
import 'package:flutter_template/pages/main/widgets/recommend.dart';
import 'package:get/get.dart';
import './widgets/cates.dart';

import 'index.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: <Widget>[
          NewsCateWidget(),
          Divider(height: 1),
          NewsRecommend(),
          Divider(height: 1),
          NewsChannelsWidget(),
          Divider(height: 1),
          NewsListWidget(),
          Divider(height: 1),
          NewsletterWidget(),
        ],
      ),
    );
  }
}
