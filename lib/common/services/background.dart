import 'package:background_fetch/background_fetch.dart';
import 'package:flutter_template/common/index.dart';
import 'package:get/get.dart';

class BackgroundService extends GetxService {
  static BackgroundService get to => Get.find();

  Future<BackgroundService> init() async {
    return this;
  }

  @pragma('vm:entry-point')
  static void backgroundFetchHeadlessTask(HeadlessTask task) async {
    String taskId = task.taskId;
    bool isTimeout = task.timeout;
    if (isTimeout) {
      // This task has exceeded its allowed running-time.
      // You must stop what you're doing and immediately .finish(taskId)
      utilLogger.d("[BackgroundFetch] Headless task timed-out: $taskId");
      BackgroundFetch.finish(taskId);
      return;
    }
    utilLogger.d('[BackgroundFetch] Headless event received.');
    // Do your work here...
    BackgroundFetch.finish(taskId);
  }
}
