import 'package:estructure_features/features/home/presentation/bloc/equatable/equatabl_bloc.dart';
import 'package:estructure_features/features/home/presentation/ui/home_page_equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/di/service_locator.dart';
import '../home/presentation/bloc/post_bloc.dart';
import '../home/presentation/ui/home_page.dart';
import 'app.dart';
import 'routes.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
mixin RouterMixin on State<MyApp> {
  GoRouter? _router;

  GoRouter get router {
    _router ??= GoRouter(
      initialLocation: '/',
      navigatorKey: rootNavigatorKey,
      routes: [
        GoRoute(
          name: Routes.home,
          path: '/',
          parentNavigatorKey: rootNavigatorKey,
          builder: (_, __) => BlocProvider.value(
            value: serviceLocator<PostBloc>()..add(const PostEvent.getPost()),
            child: const HomePage(),
          ),
        ),
        GoRoute(
          name: Routes.homeEquatable,
          path: '/',
          parentNavigatorKey: rootNavigatorKey,
          builder: (_, __) => BlocProvider.value(
            value: serviceLocator<EquatablBloc>()..add(GetPostEvent()),
            child: const HomePageEquatable(),
          ),
        ),
      ],
    );
    return _router!;
  }
}
