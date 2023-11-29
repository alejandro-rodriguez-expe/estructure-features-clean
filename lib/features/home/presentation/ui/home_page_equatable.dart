
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/service_locator.dart';
import '../bloc/equatable/equatabl_bloc.dart';
import 'widgets/list_post_widget.dart';

class HomePageEquatable extends StatelessWidget {
  const HomePageEquatable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('GetPost'),
      ),
      body: Center(
        child: BlocBuilder<EquatablBloc, EquatablState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const CircularProgressIndicator.adaptive();
            } else if (state is LoadedState) {
              return RefreshIndicator.adaptive(
                onRefresh: () async =>
                    serviceLocator<EquatablBloc>()..add(GetPostEvent()),
                child: ListPostsWidget(posts: state.post),
              );
            } else {
              return const Text('Error');
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => serviceLocator<EquatablBloc>()..add(GetPostEvent()),
        tooltip: 'get Post',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
