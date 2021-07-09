import 'dart:async';

import 'package:flutter/material.dart';

class TabControllerPage extends StatelessWidget {
  static final String routePath = '/tab';

  final GlobalKey _keyTab01 = GlobalKey();
  final GlobalKey _keyTab02 = GlobalKey();
  final GlobalKey _keyTab03 = GlobalKey();

  Widget tab01() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(16),
          color: Colors.blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('랭킹1위'),
              Text('랭킹2위'),
              Text('랭킹3위'),
              Text('랭킹3위'),
              Text('랭킹3위'),
              Text('랭킹3위'),
              Text('랭킹3위'),
              Text('랭킹3위'),
              Text('랭킹3위'),
              Text('랭킹3위'),
              Text('랭킹3위'),
              Text('랭킹3위'),
              Text('랭킹3위'),
              Text('랭킹3위'),
              Text('랭킹3위'),
              Text('랭킹3위'),
              Text('랭킹3위'),
              Text('랭킹3위'),
              Text('랭킹3위'),
              Text('랭킹3위'),
              Text('랭킹3위'),
              Text('랭킹3위'),
              Text('랭킹3위'),
              Text('랭킹3위'),
              Text('랭킹3위'),
              Text('랭킹3위'),
              Text('랭킹3위'),
              Text('랭킹3위'),
              Text('랭킹3위'),
              Text('랭킹3위'),
            ],
          ),
        )
      ],
    );
  }

  Widget tab02() {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.amber,
              border: Border.all(width: 1, color: Colors.black)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('미션수행중1'),
                Text('미션수행중2'),
                Text('미션수행중3'),
                Text('미션수행중4'),
                Text('미션수행중5'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Stream<int> _changeMoneyA() async* {
    yield 0;
    await Future.delayed(Duration(seconds: 2));
    yield 10;
    await Future.delayed(Duration(seconds: 1));
    yield 100;
  }

  final StreamController _streamController = StreamController.broadcast();
   void _changeMoneyB() async {
    _streamController.add(50);
    await Future.delayed(Duration(seconds: 1));
    _streamController.add(500);
    await Future.delayed(Duration(seconds: 1));
    _streamController.add(5000);
  }


  Widget showMoney(Stream<dynamic> stream) {
    _changeMoneyB();
    return Container(
      alignment: Alignment.center,
      child: StreamBuilder(
        stream: _streamController.stream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return Text(snapshot.data.toString());
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('탭컨트롤러 영역'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            color: Colors.red,
            alignment: Alignment.center,
            child: Text('캐릭터가 나오는 부분 (공통)'),
          ),
          Flexible(
            child: DefaultTabController(
              length: 3,
              child: TabBarView(
                children: [
                  SingleChildScrollView(child: Column(
                    children: [
                      tab01(),
                      Container(
                        height: 50,
                        color: Colors.green,
                        alignment: Alignment.center,
                        child: Text('공통...?'),
                      )
                    ],
                  )),
                  SingleChildScrollView(child: Column(
                    children: [
                      tab02(),
                      Container(
                        height: 50,
                        color: Colors.green,
                        alignment: Alignment.center,
                        child: Text('공통...?'),
                      )
                    ],
                  )),
                  SingleChildScrollView(child: Column(
                    children: [
                      tab01(),
                      Container(
                        height: 50,
                        color: Colors.green,
                        alignment: Alignment.center,
                        child: Text('공통...?'),
                      )
                    ],
                  )),
                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}
