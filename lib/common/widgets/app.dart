import 'package:flutter/material.dart';

/// 透明背景 AppBar
AppBar transparentAppBar({
  required BuildContext context,
  required List<Widget> actions,
  Widget title = const Text(''),
  Widget? leading,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: title,
    leading: leading,
    actions: actions,
  );
}
