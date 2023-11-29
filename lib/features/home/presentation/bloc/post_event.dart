part of 'post_bloc.dart';

@freezed
sealed class PostEvent with _$PostEvent {
  const factory PostEvent.getPost() = _GetPost;
}