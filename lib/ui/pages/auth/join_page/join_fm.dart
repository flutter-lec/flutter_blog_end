import 'package:flutter_riverpod/flutter_riverpod.dart';

/// form 데이터를 관리하는 모델 이름 fm

// 1. 창고 관리자
final JoinProvider = NotifierProvider<JoinFM, JoinModel>(() {
  return JoinFM();
});

// 2. 창고
// 보낼 데이터 창고는 null 일 수 없다 ? 타입 안쓴다
class JoinFM extends Notifier<JoinModel> {
  @override
  JoinModel build() {
    return JoinModel("", "", "");
  }

  void username(String username) {
    state.username = username;
  }

  void email(String email) {
    state.email = email;
  }

  void password(String password) {
    state.password = password;
  }
}

// 3. 창고 데이터 타입
class JoinModel {
  String username;
  String email;
  String password;

  JoinModel(this.username, this.email, this.password);
}
