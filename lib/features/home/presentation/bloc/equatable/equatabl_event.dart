part of 'equatabl_bloc.dart';

abstract class EquatablEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetPostEvent extends EquatablEvent {}
