import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:movieapp/features/auth/domain/entities/userentity.dart';
import 'package:movieapp/features/auth/domain/repo/repo.dart';
import 'package:movieapp/features/auth/domain/usecases/forgetpassword_usecase.dart';
import 'package:movieapp/features/auth/domain/usecases/login_usecase.dart';
import 'package:movieapp/features/auth/domain/usecases/logout_usecase.dart';
import 'package:movieapp/features/auth/domain/usecases/register_usecase.dart';
import 'package:movieapp/features/auth/presentation/manager/cubit/auth_state.dart';
import 'package:movieapp/features/profile/presentation/screens/profile.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  final LoginUsecase loginUsecase;
  final RegisterUsecase registerUsecase;
  final ForgetpasswordUsecase forgetPasswordUsecase;
  final LogoutUsecase logoutUsecase;
  late StreamSubscription<UserEntity?> _authStateSubscrition;
  AuthCubit({
    required this.loginUsecase,
    required this.registerUsecase,
    required this.forgetPasswordUsecase,
    required this.authRepository,
    required this.logoutUsecase,
  }) : super(AuthInitial());
  void checkAuth() {
    _authStateSubscrition = authRepository.authStateChange.listen((user) {
      if (user != null) {
        emit(Authenticated(userEntity: user));
        Get.to(()=>Profile());
      } else {
        emit(UnAuthenticated());
        Get.toNamed("/login");
      }
    });
  }

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      var user = await loginUsecase.call(email: email, password: password);
      emit(Authenticated(userEntity: user));
    } catch (e) {
      emit(AuthError(errorMessage: e.toString()));
    }
  }

  Future<void> register(
      {required String email, required String password}) async {
    emit(AuthLoading());
    try {
      var user = await registerUsecase.call(email: email, password: password);
      emit(Authenticated(userEntity: user));
    } catch (e) {
      emit(AuthError(errorMessage: e.toString()));
    }
  }

  Future<void> forgetPassword({required String email}) async {
    emit(AuthLoading());
    try {
      await forgetPasswordUsecase.call(email: email);
    } catch (e) {
      emit(AuthError(errorMessage: e.toString()));
    }
  }

  Future<void> logout() async {
    try {
      await logoutUsecase.call();
    } catch (e) {
      AuthError(errorMessage: e.toString());
    }
  }

  Future<void> close() {
    _authStateSubscrition.cancel();
    return super.close();
  }
}
