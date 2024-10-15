import 'dart:convert';

import 'package:crypto/crypto.dart';

String duSHA256(String i) {
  String salt = 'EIpWsyfiy@R@X#qn17!StJNdZK1fFF8iV6ffN!goZkqt#JxO';
  return sha256.convert(utf8.encode(i + salt)).toString();
}
