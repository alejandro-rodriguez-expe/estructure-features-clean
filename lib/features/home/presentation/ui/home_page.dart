import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/service_locator.dart';
import '../../../app/routes.dart';
import '../bloc/post_bloc.dart';
import 'widgets/list_post_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('GetPost'),
        actions: [
          IconButton(
            onPressed: () => context.pushNamed(Routes.homeEquatable),
            icon: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Center(
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            return state.when(
              loading: () => const CircularProgressIndicator.adaptive(),
              loaded: (data) => RefreshIndicator.adaptive(
                onRefresh: () async => serviceLocator<PostBloc>()
                  ..add(
                    const PostEvent.getPost(),
                  ),
                child: ListPostsWidget(posts: data),
              ),
              failed: () => const Text('Error'),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => serviceLocator<PostBloc>()
          ..add(
            const PostEvent.getPost(),
          ),
        tooltip: 'get Post',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
