import 'package:bloc_test/bloc/gift_bloc.dart';
import 'package:bloc_test/bloc/loading_bloc.dart';
import 'package:bloc_test/repository/gift_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GiftPage extends StatefulWidget {
  @override
  _GiftPageState createState() => _GiftPageState();
}

class _GiftPageState extends State<GiftPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GiftBloc>(
          create: (_) => GiftBloc(
            repository: GiftRepository(),
            loadingBloc: BlocProvider.of<LoadingBloc>(context)
          )
        ),
      ],
      child: GiftWidget()
    );
  }
}

class GiftWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GiftBloc, GiftState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('선물 리스트 및 사용'),
          ),
          body: Container(
            child: Stack(
              children: [
                ListView.builder(
                    itemCount: state.giftList.length,
                    itemBuilder: (_, index){
                      return Text(state.giftList[index].title);
                    }
                ),
                BlocBuilder<LoadingBloc, LoadingBlocState>(
                  builder: (context, loadState) {
                    if(loadState.loadingState == LoadingState.COMPLETE ){
                      return Container();
                    } else if (loadState.loadingState == LoadingState.LOADING) {
                      return Center(
                        child: CircularProgressIndicator()
                      );
                    }
                    return Container();
                  }
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              BlocProvider.of<GiftBloc>(context).add(GetGiftList());
            },
            child: Text('??'),
          ),
        );
      },
    );
  }
}
