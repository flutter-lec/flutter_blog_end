import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/utils/my_http.dart';
import 'package:logger/logger.dart';

/// 책임 -> 통신 & 파싱(body data)
class UserRepository {
  Future<Map<String, dynamic>> join(String username, String email, String password) async {
    final requestBody = {
      "username": username,
      "email": email,
      "password": password,
    };

    Response response = await dio.post("/join", data: requestBody);
    Map<String, dynamic> responseBody = response.data;
    Logger().d(responseBody);

    return responseBody;
  }

  Future<Map<String, dynamic>> login(String username, String password) async {
    // 1. Map 변환
    final requestBody = {
      "username": username,
      "password": password,
    };

    // 2. 통신
    Response response = await dio.post("/login", data: requestBody);
    Map<String, dynamic> responseBody = response.data;

    // 3. 헤더에서 토큰을 꺼내야 함. 헤더에 토큰이 들어있음
    // 이제 body 안에 토큰을 넣어주기 때문에 헤더에 꺼낼 필요 없어짐
    // String accessToken = "";
    // try {
    //   accessToken = response.headers["Authorization"]![0];
    //   responseBody["response"]["accessToken"] = accessToken;
    // } catch (e) {}
    Logger().d(responseBody);

    return responseBody;
  }

  Future<Map<String, dynamic>> autoLogin(String accessToken) async {
    Response response = await dio.post("/auto/login", options: Options(headers: {"Authorization": accessToken}));
    Map<String, dynamic> responseBody = response.data;
    Logger().d(responseBody);
    return responseBody;
  }
}
