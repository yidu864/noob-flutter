import 'package:get/get.dart';

class ApplicationState {
  // title
  final _title = "".obs;
  set title(value) => _title.value = value;
  get title => _title.value;

  // 当前 tab 页码
  final _page = 0.obs;
  set page(value) => _page.value = value;
  get page => _page.value;
}
