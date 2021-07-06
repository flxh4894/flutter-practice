
import 'package:bloc_test/model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {

  UserBloc() : super( UserState(userList: <User>[]) );

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if(event is AddUser){
      yield* addUserInfo(event.user);
    } else if(event is RemoveUser){
      yield* removeUserInfo(event.user);
    } else if(event is ListUser) {
      yield* getUserList();
    }
  }

  Stream<UserState> addUserInfo(User user) async* {
    List<User> userList = state.userList;
    userList.add(user);

    yield UserState(userList: userList);
  }

  Stream<UserState> removeUserInfo(User user) async* {
    List<User> userList = state.userList;
    userList = userList.where((element) => element.name != user.name).toList();

    yield UserState(userList: userList);
  }

  Stream<UserState> getUserList() async* {
    // Repository 에서 리스트 가져오고 State 셋업
  }

}

/*
* State 부분
* */
class UserState {
  final List<User> userList;

  UserState({required this.userList});
}

/*
* Event 부분
* */
@immutable
abstract class UserEvent extends Equatable{}

// 추가
class AddUser extends UserEvent {
  final User user;
  AddUser({
    required this.user
  });

  @override
  List<Object> get props => [this.user];
}

// 삭제
class RemoveUser extends UserEvent {
  final User user;
  RemoveUser({
    required this.user
  });

  @override
  List<Object> get props => [this.user];
}

// 리스트
class ListUser extends UserEvent {

  @override
  List<Object> get props => [];
}
