// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:encrypt/encrypt.dart';
import 'package:flutter_template/common/api/index.dart';

const prefix = 'https://42.63.242.138:11443';
const USER_NAME = 'OpenApi_Test';
// 大华管理系统(智能物联综合管理平台)的密码
const USER_PWD = '123456@test';
// 大华管理系统(智能物联综合管理平台)的 open api，申请一个就行
const CLIENT_ID = 'ICC_Test';
const CLIENT_SECRET = 'a2e79a31-0fcd-4bd6-a31d-c2c9ab7a6414';
//  此id对应 吴忠公司调度中心西南角 摄像头
const CHANNEL_ID = '1000122\$1\$0\$0';

class DahuaIccApi {
  // publickey
  static Future<String> publicKey() async {
    var resp = (await XHttp.getInstance()
            .get('$prefix/evo-apigw/evo-oauth/1.0.0/oauth/public-key'))
        .data;
    return resp['data']['publicKey'];
  }

  // token
  static Future token(String publicKey) async {
    dynamic pubKey = RSAKeyParser().parse(
        '-----BEGIN PUBLIC KEY-----\n$publicKey\n-----END PUBLIC KEY-----');
    final encrypter = Encrypter(RSA(publicKey: pubKey));

    var encryptedText = encrypter.encrypt(USER_PWD).base64; //返回加密后的base64格式文件

    var resp = (await XHttp.getInstance()
            .post('$prefix/evo-apigw/evo-oauth/1.0.0/oauth/extend/token', {
      'grant_type': 'password',
      'username': USER_NAME,
      'password': encryptedText,
      'client_id': CLIENT_ID,
      'client_secret': CLIENT_SECRET,
      'public_key': publicKey,
    }))
        .data;
    return resp['data'];
  }

  // startVideo
  static Future startVideo(
      String token, String userId, String channelId) async {
    final params = <String, dynamic>{
      "data": {'channelId': channelId, "dataType": '1', 'streamType': '1'}
    };

    XHttp.setHeader('User-Id', userId);
    XHttp.setHeader('Authorization', token);

    var resp = (await XHttp.getInstance()
            .post('$prefix/evo-apigw/admin/API/MTS/Video/StartVideo', params))
        .data;
    return resp['data'];
  }
}
