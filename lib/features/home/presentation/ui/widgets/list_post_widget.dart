import 'package:flutter/material.dart';

import '../../../domain/entity/post_entity.dart';
import 'card_listile_widget.dart';

class ListPostsWidget extends StatelessWidget {
  const ListPostsWidget({super.key, required this.posts});
  final List<PostEntity> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => CardListTileWidget(posts[index]),
      separatorBuilder: (_, __) => const Divider(),
      itemCount: posts.length,
    );
  }
}
