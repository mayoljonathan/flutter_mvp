import 'package:flutter/material.dart';

import '../post/post_list_view.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: PostListView(),
    );
  }
}
