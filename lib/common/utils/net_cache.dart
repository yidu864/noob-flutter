import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_template/common/index.dart';

class CacheObject {
  Response response;
  int timeStamp;

  CacheObject(this.response)
      : timeStamp = DateTime.now().millisecondsSinceEpoch;

  @override
  bool operator ==(Object other) {
    return response.hashCode == other.hashCode;
  }

  @override
  int get hashCode => response.realUri.hashCode;
}

String getCacheKey(RequestOptions options) => [
      options.method,
      options.uri.toString(),
      jsonEncode(options.data ?? {}),
      jsonEncode(options.queryParameters)
    ].join('&');

class NetCache extends Interceptor {
  var cache = <String, CacheObject>{};

  delete(String key) => cache.remove(key);
  _addCache(Response resp) {
    RequestOptions options = resp.requestOptions;

    // 只缓存 get 的请求
    if (options.extra["noCache"] != true &&
        options.method.toLowerCase() == "get") {
      // 如果缓存数量超过最大数量限制，则先移除最早的一条记录
      if (cache.length == CACHE_MAXCOUNT) {
        cache.remove(cache.keys.first);
      }
      String key = getCacheKey(options);
      cache[key] = CacheObject(resp);
    }
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (!CACHE_ENABLE) {
      handler.next(options);
      return;
    }

    // 下拉刷新标记
    bool refresh = options.extra['refresh'] == true;

    // 下拉刷新则删除缓存
    if (refresh) {
      if (options.extra["list"] == true) {
        //若是列表，则只要url中包含当前path的缓存全部删除（简单实现，并不精准）
        cache.removeWhere((key, v) => key.contains(options.path));
      } else {
        // 如果不是列表，则只删除uri相同的缓存
        delete(options.uri.toString());
      }
      handler.next(options);
      return;
    }

    // get 请求，开启缓存
    if (options.extra["noCache"] != true &&
        options.method.toLowerCase() == 'get') {
      String key = getCacheKey(options);
      var ob = cache[key];
      if (ob != null) {
        //若缓存未过期，则返回缓存内容
        if ((DateTime.now().millisecondsSinceEpoch - ob.timeStamp) / 1000 <
            CACHE_MAXAGE) {
          handler.resolve(cache[key]!.response);
          return;
        } else {
          //若已过期则删除缓存，继续向服务器请求
          cache.remove(key);
        }
      }
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // 如果启用缓存，将返回结果保存到缓存
    if (CACHE_ENABLE) {
      _addCache(response);
    }
    handler.next(response);
    return;
  }
}
