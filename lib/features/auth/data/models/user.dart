import 'package:firebase_auth/firebase_auth.dart';
import 'package:movieapp/features/auth/domain/entities/userentity.dart';

class UserModel extends UserEntity {
  final String uid;
  final String email;

  UserModel({
    required this.uid,
    required this.email,
  }) : super(email, uid);
  factory UserModel.fromFireBase(User firebaseUser) {
    return UserModel(
      uid: firebaseUser.uid,
      email: firebaseUser.email!,
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      'uid': uid,
      'email': email,
    };
  }
}
