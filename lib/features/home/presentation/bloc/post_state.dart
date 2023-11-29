part of 'post_bloc.dart';

@freezed
sealed class PostState with _$PostState {
  const factory PostState.loading() = _Loading;
  const factory PostState.loaded(List<PostEntity> post) = _Loaded;
  const factory PostState.failed() = _Failed;
}
