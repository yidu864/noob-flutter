import 'package:get/get.dart';

class SignInState {
  // title
  final _title = "sign_in".obs;
  set title(value) => _title.value = value;
  get title => _title.value;
}
