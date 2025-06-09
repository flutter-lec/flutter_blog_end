import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/_core/utils/my_http.dart';
import 'package:flutter_blog/data/model/post.dart';

class PostDetailProfile extends StatelessWidget {
  Post post;

  PostDetailProfile(this.post);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text("${post.user.username}"),
        leading: SizedBox(
          height: 50,
          width: 50,
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: "${baseUrl}${post.user.imgUrl}",
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
        ),
        subtitle: Row(
          children: [
            Text("ssar@nate.com"), // api 서버 개발자에게 요청
            const SizedBox(width: mediumGap),
            const Text("·"),
            const SizedBox(width: mediumGap),
            const Text("Written on "),
            Text("${post.createdAt}"), // gpt 포맷 추가하기
          ],
        ));
  }
}
