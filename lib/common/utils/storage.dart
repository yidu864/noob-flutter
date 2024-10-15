import 'package:localstorage/localstorage.dart';

/// 本地存储
/// 单例 StorageUtil().getItem('key')
Future<LocalStorage> getStorage() async {
  await initLocalStorage();
  return localStorage;
}
