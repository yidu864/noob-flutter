import 'package:flutter/material.dart';
import 'package:flutter_template/common/index.dart';

class RouteObservers<R extends Route<dynamic>> extends RouteObserver<R> {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    var name = route.settings.name ?? '';
    if (name.isNotEmpty) AppPages.history.add(name);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    AppPages.history.remove(route.settings.name);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute == null) return;

    // 找到旧的路由
    var name = newRoute.settings.name ?? '';
    if (name.isEmpty) return;
    var index =
        AppPages.history.indexWhere((e) => e == oldRoute?.settings.name);
    if (index > 0) {
      AppPages.history[index] = name;
    } else {
      AppPages.history.add(name);
    }
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    AppPages.history.remove(route.settings.name);
  }
}
