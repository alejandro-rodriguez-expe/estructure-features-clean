import 'dart:async';
import 'package:estructure_features/features/home/domain/uses_cases/posts/get_post_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/post_entity.dart';


part 'equatabl_event.dart';
part 'equatabl_state.dart';

class EquatablBloc extends Bloc<EquatablEvent, EquatablState> {
  EquatablBloc(this.postUseCase) : super(LoadingState()) {
    on<EquatablEvent>(init);
  }
  final GetPostUseCase postUseCase;
  FutureOr<void> init(event, emit) async {
    try {
      emit(LoadingState());
      final result = await postUseCase();
      emit(LoadedState(result));
    } catch (e) {
      print(e);
      emit(FailedState());
    }
  }
}
