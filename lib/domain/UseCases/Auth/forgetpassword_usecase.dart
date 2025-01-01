

import 'package:movieapp/domain/Repo/auth_repo.dart';

class ForgetpasswordUsecase {
  final AuthRepository repoimp;

  ForgetpasswordUsecase(this.repoimp);
Future call({required String email}) async => await repoimp.resetPassword(email:  email);
}