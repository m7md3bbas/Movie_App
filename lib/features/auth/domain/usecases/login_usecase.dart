import 'package:movieapp/core/widgets/get_snacbars.dart';
import 'package:movieapp/features/auth/domain/entities/userentity.dart';
import 'package:movieapp/features/auth/domain/repo/repo.dart';
import 'package:movieapp/features/auth/domain/validators/login_validator.dart';

class LoginUsecase {
  final AuthRepository repoimp;
  final LoginValidator loginValidator;
  LoginUsecase(this.repoimp, this.loginValidator);

  Future<UserEntity> call(
      {required String email, required String password}) async {
    final emailError = loginValidator.validateEmail(email: email);
    final passwordError = loginValidator.validatePassword(password: password);
    if (emailError != null) {
      GetSnacbars.ErrorSnackbar(emailError.toString());
      return UserEntity("", "");
    }
    if (passwordError != null) {
      GetSnacbars.ErrorSnackbar(passwordError.toString());
      return UserEntity("", "");
    }

    return await repoimp.login(email: email, password: password);
  }
}
