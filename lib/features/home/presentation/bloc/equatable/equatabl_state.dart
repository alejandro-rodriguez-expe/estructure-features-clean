part of 'equatabl_bloc.dart';

abstract class EquatablState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadingState extends EquatablState {}

class LoadedState extends EquatablState {
  LoadedState(this.post);
  final List<PostEntity> post;

 @override
  List<Object> get props => [post];
}

class FailedState extends EquatablState {}
