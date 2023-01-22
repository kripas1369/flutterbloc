import 'package:flutterbloc/blocs/app_events.dart';
import 'package:flutterbloc/blocs/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/repos/repositories.dart';

class UserBloc extends Bloc<UserEvents, UserState> {
  final UserRepositories _userRepositories;

  UserBloc(this._userRepositories) : super(UserLoadingState()) {
    on<LoadUserEvents>((event, emit) async {
      emit(UserLoadingState());
      try {
        final users = await _userRepositories.getUsers();
        emit(UserloadedState(users));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
  }
}
