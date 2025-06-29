import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login({
    required String userName,
    required String password,
  }) async {
    emit(LoginLoading());

    await Future.delayed(Duration(seconds: 2));
    if (userName == 'admin' && password == 'password') {
      emit(LoginSuccess());
    } else {
      emit(
        LoginFailure(errorMessage: 'Invalid Password OR Username'),
      );
    }
  }
}
