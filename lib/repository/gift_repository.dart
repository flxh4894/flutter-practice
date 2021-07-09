
import 'package:bloc_test/model/gift.dart';

/*
* 모든 메서드들은 서버와 통신에 1초가 소요 된다고 가정하고 작업한다.
* */

class GiftRepository {

  /// 선물 리스트 가져오기
  Future<List<Gift>> getGiftList() async {
    await Future.delayed(Duration(seconds: 1));

    return [
      Gift(id: 4, title: '펀드쿠폰21', desc: '펀드 20,000원 쿠폰', createdAt: DateTime.now().toString()),
      Gift(id: 5, title: '채권쿠폰12', desc: '채권 15,000원 쿠폰', createdAt: DateTime.now().toString()),
      Gift(id: 6, title: '주식쿠폰21', desc: '주식 50,000원 쿠폰', createdAt: DateTime.now().toString()),
    ];
  }

  // 선물 사용 하기 (삭제)
  Future<Gift> useGift(Gift gift) async {
    await Future.delayed(Duration(seconds: 1));

    return gift;
  }

}