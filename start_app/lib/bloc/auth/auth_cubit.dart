import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:start_app/navigation/nav.dart';
import 'package:start_app/util/shared_pref.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void emailSignIn(String email, String password) async {
    try {
      final userCreds = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      SharedPref.setUserLoggedIn(true);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      Fluttertoast.showToast(msg: e.message ?? "An error occurred");
    } catch (e) {
      print(e);
    }
  }

  Future<void> signUpWithEmail(String email, String password) async {
    try {
      emit(AuthLoading());
      final userCreds = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      Fluttertoast.showToast(msg: "Account created successfully!");
      // await currentUser.sendEmailVerification();

      emit(AuthSuccess(user: userCreds));
      Nav.pop();
    } on FirebaseAuthException catch (e, s) {
      print(e.code);
      print(e.message);
      print(s);
      Fluttertoast.showToast(msg: e.message ?? "An error occurred");

      emit(AuthError(errorMessage: e.message ?? "An error occurred"));
    } catch (e, s) {
      print(e);
      print(s);
      emit(AuthError(errorMessage: "An error occurred"));
    }
  }

  signInwithGoogle() async {
    // Trigger the authentication flow

    final google = GoogleSignIn();

    // await google.signOut();
    final userAccount = await google.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await userAccount?.authentication;

    /// OAuth2
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signInWithFacebook() async {
    final result = await FacebookAuth.instance.login();

    final status = result.status;

    if (status == LoginStatus.failed) {
      Fluttertoast.showToast(msg: "Login failed");
      return;
    }

    if (status == LoginStatus.cancelled) {
      Fluttertoast.showToast(msg: "Login canclled by user");
      return;
    }
    if (status == LoginStatus.success) {
      final token = result.accessToken!.token;

      final credential = FacebookAuthProvider.credential(token);

      final firebaseUserCreds =
          await FirebaseAuth.instance.signInWithCredential(credential);
    }
  }
}
