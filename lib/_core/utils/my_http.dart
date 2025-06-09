import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// final baseUrl = "http://192.168.0.123:8080";
final baseUrl = "http://172.30.1.6:8080";

//로그인 되면, dio에 jwt 추가하기
//dio.options.headers['Authorization'] = 'Bearer $_accessToken';
final dio = Dio(
  BaseOptions(
    baseUrl: baseUrl, // 내 IP 입력
    contentType: "application/json; charset=utf-8",
    validateStatus: (status) => true, // 200 이 아니어도 예외 발생안하게 설정 // 그냥 예외 터지면 dio 가 잡아서 처리함
  ),
);

/// 디바이스 DB에 접근 할 수 있음
const secureStorage = FlutterSecureStorage();
