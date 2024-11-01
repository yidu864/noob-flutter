import 'package:flutter_template/common/index.dart';
import 'package:get/get.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationController extends GetxController {
  NotificationController();

  @override
  void onInit() {
    super.onInit();
    onNoticeInit();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  onNoticeInit() async {
    // 初始化通知
    // 初始化推送通知插件
  }

  /// 首先，创建了一个通知频道，用于控制该推送通知的行为和样式。
  /// 然后，我们构建了通知内容，设置了标题和内容。
  /// 最后，调用show()方法发送推送通知。
  onPushNotice() async {
// 通知信息来源...
// 在应用程序启动时初始化通知设置
    final plugin = FlutterLocalNotificationsPlugin();
    const initAnd = AndroidInitializationSettings('@mipmap/ic_launcher');
    await plugin.initialize(
      const InitializationSettings(android: initAnd),
      onDidReceiveNotificationResponse: (detail) {
        switch (detail.notificationResponseType) {
          case NotificationResponseType.selectedNotification:
            utilLogger.d(
                'NotificationResponseType.selectedNotification:被点击了${detail.payload}');
            break;
          case NotificationResponseType.selectedNotificationAction:
            utilLogger
                .d('NotificationResponseType.selectedNotificationAction:被点击了');
            break;
        }
      },
    );
    const infoText = BigTextStyleInformation(
      '君不见黄河之水天上来，奔流到海不复回。君不见高堂明镜悲白发，朝如青丝暮成雪。人生得意须尽欢，莫使金樽空对月。天生我材必有用，千金散尽还复来。烹羊宰牛且为乐，会须一饮三百杯。岑夫子，丹丘生，将进酒，杯莫停。与君歌一曲，请君为我倾耳听。钟鼓馔玉不足贵，但愿长醉不复醒。古来圣贤皆寂寞，惟有饮者留其名。陈王昔时宴平乐，斗酒十千恣欢谑。主人何为言少钱，径须沽取对君酌。五花马，千金裘，呼儿将出换美酒，与尔同销万古愁。',
      htmlFormatBigText: true,
      contentTitle: '通知标题',
      htmlFormatContentTitle: true,
      summaryText: '有趣的通知',
      htmlFormatSummaryText: true,
    );

    // 发送通知
    const detail = AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
      styleInformation: infoText,
    );
    var details = const NotificationDetails(android: detail);

    await plugin.show(
      0,
      '消息头',
      '消息体',
      details,
      payload: "It's a playload",
    );
  }

  Future<void> handleNoticeClick(String payload) async {
    // 处理通知点击事件
    utilLogger.d('Notice Click: $payload');
  }
}
