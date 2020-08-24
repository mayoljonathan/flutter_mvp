import 'package:flutter/material.dart';
import 'package:flutter_mvp/data/model/post.dart';

class PostCard extends StatelessWidget {
  PostCard({
    Key key,
    @required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Icon(Icons.person),
                ),
                SizedBox(width: 12.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.author?.displayName ?? '',
                        style: textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 6.0),
                      Text(
                        post.createdAt,
                        style: textTheme.caption,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Text(post.body),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 14,
                      child: Icon(
                        Icons.thumb_up,
                        size: 16,
                      ),
                    ),
                    if (post.hasLikes)
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(post.likesCountAsString),
                      ),
                  ],
                ),
                if (post.hasComments) Text(post.commentsCountAsString)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
