

import 'package:movieapp/domain/Repo/auth_repo.dart';

class LogoutUsecase {
  final AuthRepository repoim;
  LogoutUsecase( this.repoim);

  Future<void> call() async => await repoim.logout();
}
