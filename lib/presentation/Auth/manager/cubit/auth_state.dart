

import 'package:movieapp/domain/Entities/auth_user_entity.dart';

abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class Authenticated extends AuthState {
  final UserEntity userEntity;

  Authenticated({required this.userEntity});
}

final class UnAuthenticated extends AuthState {}

final class AuthError extends AuthState {
  final String errorMessage;

  AuthError({required this.errorMessage});
}
