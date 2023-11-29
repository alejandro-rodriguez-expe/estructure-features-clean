import 'package:flutter/material.dart';

import '../../../domain/entity/post_entity.dart';

class CardListTileWidget extends StatelessWidget {
  const CardListTileWidget(this.post, {super.key});

  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text(post.id.toString()),
        ),
        title: Text(post.title),
        subtitle: Text(post.body),
      ),
    );
  }
}
