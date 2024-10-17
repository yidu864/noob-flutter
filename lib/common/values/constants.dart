// ignore_for_file: constant_identifier_names

/// 常量
class Constants {
  // 服务 api
  static const apiUrl = 'https://apifoxmock.com/m1/5270529-4938884-default';
}

const String STORAGE_MASTER_KEY = 'ducafcat_news_app';
const String STORAGE_USER_TOKEN_KEY = 'user_token';

/// 用户配置信息
const String STORAGE_USER_PROFILE_KEY = 'user_profile';

// 是否启用缓存
const CACHE_ENABLE = false;

// 缓存的最长时间，单位（秒）
const CACHE_MAXAGE = 1000;

// 最大缓存数
const CACHE_MAXCOUNT = 100;

// TODO:是否APIFOX
const IS_APIFOX = true;

// 是否开启代理调试
const PROXY_ENABLE = false;
const PROXY_IP = '192.168.5.115';
const PROXY_PORT = '8080';
