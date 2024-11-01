import 'package:background_fetch/background_fetch.dart';
import 'package:flutter_template/common/index.dart';
import 'package:get/get.dart';

class BackgroundController extends GetxController {
  Rx<bool> enabled = true.obs;
  Rx<int> status = 0.obs;
  RxList events = [].obs;

  BackgroundController();

  String getStatusStr(int i) {
    switch (i) {
      case BackgroundFetch.STATUS_AVAILABLE:
        return 'STATUS_AVAILABLE';
      case BackgroundFetch.STATUS_DENIED:
        return 'STATUS_DENIED';
      case BackgroundFetch.STATUS_RESTRICTED:
        return 'STATUS_RESTRICTED';
      default:
        return 'UNKONW';
    }
  }

  void onClickEnable(enabled) {
    enabled.value = enabled;
    if (enabled) {
      BackgroundFetch.start().then((int status) {
        utilLogger
            .d('[BackgroundFetch] start success: ${getStatusStr(status)}');
      }).catchError((e) {
        utilLogger.d('[BackgroundFetch] start FAILURE: $e');
      });
    } else {
      BackgroundFetch.stop().then((int status) {
        utilLogger.d('[BackgroundFetch] stop success: ${getStatusStr(status)}');
      });
    }
  }

  void onClickStatus() async {
    int nstatus = await BackgroundFetch.status;
    utilLogger.d('[BackgroundFetch] status: ${getStatusStr(nstatus)}');
    status.value = nstatus;
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future _eventHandler(String taskId) async {
    // <-- Event handler
    // This is the fetch-event callback.
    utilLogger.d("[BackgroundFetch] Event received $taskId");
    events.insert(0, DateTime.now());
    // IMPORTANT:  You must signal completion of your task or the OS can punish your app
    // for taking too long in the background.
    BackgroundFetch.finish(taskId);
  }

  Future _timeoutHandler(String taskId) async {
    // <-- Task timeout handler.
    // This task has exceeded its allowed running-time.  You must stop what you're doing and immediately .finish(taskId)
    utilLogger.d("[BackgroundFetch] TASK TIMEOUT taskId: $taskId");
    BackgroundFetch.finish(taskId);
  }

  Future<void> initPlatformState() async {
    // Configure BackgroundFetch.
    int nstatus = await BackgroundFetch.configure(
        BackgroundFetchConfig(
            minimumFetchInterval: 1,
            stopOnTerminate: false,
            enableHeadless: true,
            requiresBatteryNotLow: false,
            requiresCharging: false,
            requiresStorageNotLow: false,
            requiresDeviceIdle: false,
            forceAlarmManager: true,
            requiredNetworkType: NetworkType.NONE),
        _eventHandler,
        _timeoutHandler);
    utilLogger
        .d('[BackgroundFetch] configure success: ${getStatusStr(nstatus)}');
    status.value = nstatus;
  }

  @override
  void onInit() {
    super.onInit();
    initPlatformState();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
