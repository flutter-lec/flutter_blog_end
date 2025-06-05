import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/theme.dart';
import 'package:flutter_blog/ui/pages/auth/join_page/join_page.dart';
import 'package:flutter_blog/ui/pages/auth/login_page/login_page.dart';
import 'package:flutter_blog/ui/pages/post/list_page/post_list_page.dart';
import 'package:flutter_blog/ui/pages/post/write_page/post_write_page.dart';
import 'package:flutter_blog/ui/pages/splash/splash_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO: 1. Stack의 가장 위 context를 알고 있다. [지금 몰라도 됨] 맨 위에 있는 화면의 context를 찾을 수 있다. -> 뒤로가기 알림창 띄울때 사용
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      // context가 없는 곳에서 context를 사용할 수 있는 방법
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      // 스플레시 페이지는 준비 화면인데 통신을 하지 않으면 쓸모 없다
      routes: {
        "/login": (context) => const LoginPage(),
        "/join": (context) => const JoinPage(),
        "/post/list": (context) => PostListPage(),
        "/post/write": (context) => const PostWritePage(),
      },
      theme: theme(),
    );
  }
}
