import 'package:movieapp/features/auth/domain/repo/repo.dart';

class LogoutUsecase {
  final AuthRepository repoim;
  LogoutUsecase( this.repoim);

  Future<void> call() async => await repoim.logout();
}
