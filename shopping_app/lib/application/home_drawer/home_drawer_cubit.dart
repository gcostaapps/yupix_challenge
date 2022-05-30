import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_drawer_state.dart';
part 'home_drawer_cubit.freezed.dart';

class HomeDrawerCubit extends Cubit<HomeDrawerState> {
  HomeDrawerCubit() : super(const HomeDrawerState.products());

  void onTapDrawerItem(HomeDrawerState state) => emit(state);
}
