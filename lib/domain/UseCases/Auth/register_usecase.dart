

import 'package:movieapp/core/validators/reigster_validator.dart';
import 'package:movieapp/core/widgets/get_snacbars.dart';
import 'package:movieapp/domain/Entities/auth_user_entity.dart';
import 'package:movieapp/domain/Repo/auth_repo.dart';

class RegisterUsecase {
  final AuthRepository repoimp;
  final ReigsterValidator reigsterValidator;
  RegisterUsecase(this.repoimp, this.reigsterValidator);

  Future<UserEntity> call(
      {required String email, required String password}) async {
    final emailError = reigsterValidator.validateEmail(email: email);
    final passwordError =
        reigsterValidator.validatePassword(password: password);
    if (emailError != null) {
      GetSnacbars.ErrorSnackbar(emailError.toString());
      return UserEntity("", "");
    }
    if (passwordError != null) {
      GetSnacbars.ErrorSnackbar(passwordError.toString());

      return UserEntity("", "");
    }
    return await repoimp.signup(email: email, password: password);
  }
}
