import 'package:bloc_test/model/gift.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bloc_cubit.g.dart';

/*
* Cubit
* */
class GiftCubit extends Cubit<GiftCubitState> {
  GiftCubit() : super(GiftCubitState(giftList: <Gift>[], useUserNm: ''));

  void printGift() {
    print(state.giftList);
    emit(state);
  }

  void printUseUser() {
    print(state.useUserNm);
  }

  void changeUseUser(String name) {
    emit(GiftCubitState(giftList: <Gift>[], useUserNm: name));
    print(state.useUserNm);
  }
}

/*
* state
* */
@CopyWith()
class GiftCubitState {
  final List<Gift> giftList;
  final String useUserNm;

  GiftCubitState({required this.giftList, required this.useUserNm});
}
