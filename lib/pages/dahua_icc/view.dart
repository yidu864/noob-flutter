import 'package:flutter/material.dart';
import 'package:flutter_template/common/index.dart';
import 'package:get/get.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

import 'index.dart';

class DahuaIccPage extends GetView<DahuaIccController> {
  const DahuaIccPage({super.key});

  beforePlay() async {
    try {
      var pubKey = await DahuaIccApi.publicKey();
      var tokenResp = await DahuaIccApi.token(pubKey);
      var videoResp = await DahuaIccApi.startVideo(
          "${tokenResp['token_type']} ${tokenResp['access_token']}",
          tokenResp['userId'],
          '1000122\$1\$0\$0');
      // 'start video api fail'
      if (videoResp['code'] == 1001) throw Error();
      controller.videoUrl.value =
          "${(videoResp['url'] as String).split('|')[1]}?token=${videoResp['token']}";
      // videoUrl.value =
      //     'rtsp://rtspstream:e30a0fbb7c68a5907cff965fc709f457@zephyr.rtsp.stream/movie';

      controller.vlcc = VlcPlayerController.network(controller.videoUrl.value,
          // 'rtmp://58.200.131.2:1935/livetv/hunantv',
          hwAcc: HwAcc.full,
          autoPlay: true,
          options: VlcPlayerOptions(rtp: VlcRtpOptions(['--rtsp-tcp'])));
    } catch (e) {
      utilLogger.e(e);
    }
  }

  onStopPlay() async {
    if (controller.videoUrl.isEmpty) return;
    await controller.vlcc.stop();
    await controller.vlcc.dispose();
    controller.videoUrl.value = '';
  }

  // 主视图
  Widget _buildView() {
    return FractionallySizedBox(
      widthFactor: 1,
      heightFactor: 1,
      child: Obx(() => Column(
            children: [
              controller.videoUrl.value.isEmpty
                  ? Container()
                  : VlcPlayer(controller: controller.vlcc, aspectRatio: 16 / 9),
              Text(controller.videoUrl.value),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: beforePlay, child: const Text('播放')),
                  TextButton(onPressed: onStopPlay, child: const Text('停止'))
                ],
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DahuaIccController>(
      init: DahuaIccController(),
      id: "dahua_icc",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("dahua_icc")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
