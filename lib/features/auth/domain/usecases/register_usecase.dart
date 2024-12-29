import 'package:movieapp/core/widgets/get_snacbars.dart';
import 'package:movieapp/features/auth/domain/entities/userentity.dart';
import 'package:movieapp/features/auth/domain/repo/repo.dart';
import 'package:movieapp/features/auth/domain/validators/reigster_validator.dart';

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
