import 'package:dio/dio.dart';
import 'package:estructure_features/features/home/presentation/bloc/equatable/equatabl_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/datasource/remote/post_datasource.dart';
import '../../features/home/data/repositories/post_repositoy_impl.dart';
import '../../features/home/domain/repositories/post_repositoy.dart';
import '../../features/home/domain/uses_cases/posts/get_post_use_case.dart';
import '../../features/home/presentation/bloc/post_bloc.dart';
import '../constants/constants.dart';

final serviceLocator = GetIt.instance;

setupServiceLocator() async {
  serviceLocator.registerFactory<Constant>(() => Constant());
  serviceLocator.registerFactory<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: serviceLocator<Constant>().apiBaseUrl,
      ),
    ),
  );

  serviceLocator.registerLazySingleton<PostDataSource>(
    () => PostDataSourceImpl(serviceLocator()),
  );

  serviceLocator.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(serviceLocator()),
  );

  serviceLocator.registerLazySingleton<GetPostUseCase>(
    () => GetPostUseCase(serviceLocator()),
  );

  serviceLocator.registerLazySingleton<PostBloc>(
    () => PostBloc(serviceLocator()),
  );

  serviceLocator.registerLazySingleton<EquatablBloc>(
    () => EquatablBloc(serviceLocator()),
  );
}
