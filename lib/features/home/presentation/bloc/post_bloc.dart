import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/post_entity.dart';
import '../../domain/uses_cases/posts/get_post_use_case.dart';

part 'post_event.dart';
part 'post_state.dart';
part 'post_bloc.freezed.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc(this.getPostUseCase) : super(const PostState.loading()) {
    on<PostEvent>(init);
  }

  FutureOr<void> init(event, emit) async {
    try {
      emit(const PostState.loading());
      final result = await getPostUseCase();
      emit(PostState.loaded(result));
    } catch (e) {
      emit(const PostState.failed());
    }
  }

  final GetPostUseCase getPostUseCase;
}
