import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

/// 测试安卓系统通知以及后台任务的页面
class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({super.key});

  // 主视图
  Widget _buildView() {
    return Center(
      child: TextButton(
          onPressed: controller.onPushNotice, child: const Text('发送通知')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      init: NotificationController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("通知")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
