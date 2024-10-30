import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import './widgets/news_page_list.dart';

class CategoryPage extends GetView<CategoryController> {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NewsPageList(),
    );
  }
}
