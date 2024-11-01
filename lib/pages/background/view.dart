import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'index.dart';

class BackgroundPage extends GetView<BackgroundController> {
  const BackgroundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<BackgroundController>(
      init: BackgroundController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
              title: const Text('BackgroundFetch Example',
                  style: TextStyle(color: Colors.black)),
              backgroundColor: Colors.amberAccent,
              actions: <Widget>[
                Switch(
                    value: controller.enabled.value,
                    onChanged: controller.onClickEnable),
              ],
              systemOverlayStyle: SystemUiOverlayStyle.dark),
          body: Container(
            color: Colors.white,
            child: ListView.builder(
                itemCount: controller.events.length,
                itemBuilder: (BuildContext context, int index) {
                  DateTime timestamp = controller.events[index];
                  return InputDecorator(
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(
                              left: 10.0, top: 10.0, bottom: 0.0),
                          labelStyle: TextStyle(
                              color: Colors.amberAccent, fontSize: 20.0),
                          labelText: "[background fetch event]"),
                      child: Text(timestamp.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16.0)));
                }),
          ),
          bottomNavigationBar: BottomAppBar(
              child: Row(children: <Widget>[
            TextButton(
                onPressed: controller.onClickStatus,
                child: const Text('Status')),
            Container(
                margin: const EdgeInsets.only(left: 20.0),
                child: Text("${controller.status.value}"))
          ])),
        );
      },
    );
  }
}
