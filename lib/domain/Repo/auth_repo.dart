

import 'package:movieapp/domain/Entities/auth_user_entity.dart';

abstract class AuthRepository {
  Stream <UserEntity?> get authStateChange;
  Future<UserEntity> login({required String email,required String password});
  Future<UserEntity> signup({required String email,required String password});
  Future<void> logout();
  Future<void> resetPassword({required String email});
}