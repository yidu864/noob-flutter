import 'package:intl/intl.dart';

/// 格式化时间
String dateFormat(DateTime dt) {
  var now = DateTime.now();
  var diff = now.difference(dt);

  if (diff.inHours < 24) {
    return '${diff.inHours} hours ago';
  } else if (diff.inDays < 30) {
    return '${diff.inDays} days ago';
  } else if (diff.inDays < 365) {
    final dtFormat = DateFormat('MM-dd');
    return dtFormat.format(dt);
  } else {
    final dtFormat = DateFormat('yyyy-MM-dd');
    return dtFormat.format(dt);
  }
}
