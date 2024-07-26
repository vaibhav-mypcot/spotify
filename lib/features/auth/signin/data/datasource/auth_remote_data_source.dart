import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/core/error/exceptions.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<String> signInWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl();

  @override
  Future<String> signInWithEmailPassword({
    required String email,
    required String password,
  }) async{
     try {
      final response = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (response.user == null) {
        throw const ServerException('User is null');
      }

      return response.user!.uid;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> signUpWithEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final response = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // Create firestore collection to store data

      await FirebaseFirestore.instance
          .collection('users')
          .doc(response.user!.uid)
          .set(
        {
          "unique_id": response.user!.uid.toString(),
          "name": name.toString(),
          "email": email.toString(),
          "password": password.toString(),
        },
      );

      if (response.user == null) {
        throw const ServerException('User is null');
      }

      return response.user!.uid;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
