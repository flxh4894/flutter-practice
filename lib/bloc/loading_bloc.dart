import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
* 공통 - Loading Bloc
* */
class LoadingBloc extends Bloc<LoadingEvent, LoadingBlocState> {

  LoadingBloc() : super(LoadingBlocState( loadingState: LoadingState.COMPLETE) );

  @override
  Stream<LoadingBlocState> mapEventToState(LoadingEvent event) async* {
    if(event is IsError){
      yield LoadingBlocState(loadingState: LoadingState.ERROR);
    } else if (event is IsLoading) {
      yield LoadingBlocState(loadingState: LoadingState.LOADING);
    } else if (event is IsComplete) {
      yield LoadingBlocState(loadingState: LoadingState.COMPLETE);
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}

/*
* 공통 - Loading Event
* */
@immutable
abstract class LoadingEvent extends Equatable { }

// 로딩중
class IsLoading extends LoadingEvent {
  @override
  List<Object> get props => [];
}

// 에러
class IsError extends LoadingEvent {
  final String message;
  IsError({required this.message});

  @override
  List<Object> get props => [this.message];
}

// 완료
class IsComplete extends LoadingEvent {
  @override
  List<Object> get props => [];
}

/*
* 공통 - Loading State
* */
enum LoadingState { LOADING, COMPLETE, ERROR }
class LoadingBlocState {
  LoadingState loadingState;

  LoadingBlocState({
    required this.loadingState
  });
}

