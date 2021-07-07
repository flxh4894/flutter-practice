import 'package:bloc_test/bloc/loading_bloc.dart';
import 'package:bloc_test/model/gift.dart';
import 'package:bloc_test/respository/gift_repository.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'gift_bloc.g.dart';
/*
* bloc
* */
class GiftBloc extends Bloc<GiftEvent, GiftState> {

  final GiftRepository repository;
  final LoadingBloc loadingBloc;

  // 초기에는 아무것도 없는 것으로 설정
  GiftBloc({
    required this.repository,
    required this.loadingBloc
  }) : super( GiftState(giftList: <Gift>[], useGift: null, lastGiftNm: '사용 기록 없음') );

  @override
  Stream<GiftState> mapEventToState(GiftEvent event) async* {
    if(event is GetGiftList){
      yield* getGiftList();
    } else if(event is UseGift){
      if(state.useGift != null){
        yield* _useGift(state.useGift as Gift);
      }
    }
  }

  Stream<GiftState> getGiftList() async* {

    loadingBloc.add(IsLoading());

    List<Gift> list = await repository.getGiftList();

    loadingBloc.add(IsComplete());

    yield this.state.copyWith(giftList: [...state.giftList, ...list]);
  }

  Stream<GiftState> _useGift(Gift gift) async* {
    // print('선물 사용 ${gift.toJson()}');
  }
}

/*
* state
* */

@CopyWith()
class GiftState {
  List<Gift> giftList;
  Gift? useGift;
  String lastGiftNm;

  GiftState({
    required this.giftList,
    required this.useGift,
    required this.lastGiftNm
  });
}

/*
* event
* */
@immutable
abstract class GiftEvent extends Equatable{}

// 선물 리스트 가져오기
class GetGiftList extends GiftEvent{
  @override
  List<Object> get props => [];
}

// 선물 사용하기
class UseGift extends GiftEvent{
  final Gift gift;
  UseGift({
    required this.gift
  });

  @override
  List<Object> get props => [this.gift];
}

