import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:movieapp/features/auth/data/datasource/remouteDataSource/remotedatasource.dart';
import 'package:movieapp/features/auth/domain/repo/repo.dart';
import 'package:movieapp/features/auth/domain/usecases/forgetpassword_usecase.dart';
import 'package:movieapp/features/auth/domain/usecases/login_usecase.dart';
import 'package:movieapp/features/auth/domain/usecases/logout_usecase.dart';
import 'package:movieapp/features/auth/domain/usecases/register_usecase.dart';
import 'package:movieapp/features/auth/domain/validators/login_validator.dart';
import 'package:movieapp/features/auth/domain/validators/reigster_validator.dart';
import 'package:movieapp/features/auth/presentation/manager/cubit/auth_cubit.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthRepository>(FirebaseAuthDataSource(FirebaseAuth.instance));
    Get.put<LoginValidator>((LoginValidator()));
    Get.put<ReigsterValidator>((ReigsterValidator()));

    Get.put<LoginUsecase>(
        LoginUsecase(Get.find<AuthRepository>(), Get.find<LoginValidator>()));
    Get.put<RegisterUsecase>(RegisterUsecase(
        Get.find<AuthRepository>(), Get.find<ReigsterValidator>()));
    Get.put<ForgetpasswordUsecase>(
        ForgetpasswordUsecase(Get.find<AuthRepository>()));
    Get.put<LogoutUsecase>(LogoutUsecase(Get.find<AuthRepository>()));

    Get.lazyPut<AuthCubit>(() => AuthCubit(
        loginUsecase: Get.find<LoginUsecase>(),
        registerUsecase: Get.find<RegisterUsecase>(),
        forgetPasswordUsecase: Get.find<ForgetpasswordUsecase>(),
        authRepository: Get.find<AuthRepository>(),
        logoutUsecase: Get.find<LogoutUsecase>()));
  }
}
