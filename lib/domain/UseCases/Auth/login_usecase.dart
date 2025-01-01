

import 'package:movieapp/core/validators/login_validator.dart';
import 'package:movieapp/core/widgets/get_snacbars.dart';
import 'package:movieapp/domain/Entities/auth_user_entity.dart';
import 'package:movieapp/domain/Repo/auth_repo.dart';

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
