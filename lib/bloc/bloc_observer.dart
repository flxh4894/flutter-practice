import 'package:flutter_bloc/flutter_bloc.dart';

class LoadBlocObserver extends BlocObserver{
  @override
  void onChange(BlocBase bloc, Change change) {
    print('BlocObserver onChange() >>>> $bloc');
    print('BlocObserver onChange() >>>> $change');
    super.onChange(bloc, change);
  }
}