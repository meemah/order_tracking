import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:order_tracking/repo/authentication_repo.dart';
import 'package:order_tracking/shared/locator.dart';
import 'package:order_tracking/shared/widgets/app_toast.dart';

import '../shared/utils/network_helper/network_data_response.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepo authRepo = serviceLocator<AuthRepo>();
  NetworkDataResponse<UserCredential> _googleSignInResponse =
      NetworkDataResponse.idle();

  NetworkDataResponse<UserCredential> get googleSignInResponse =>
      _googleSignInResponse;

  set googleSignInResponse(NetworkDataResponse<UserCredential> value) {
    _googleSignInResponse = value;
    notifyListeners();
  }

  NetworkDataResponse<UserCredential> _githubSignInResponse =
      NetworkDataResponse.idle();

  NetworkDataResponse<UserCredential> get githubSignInResponse =>
      _githubSignInResponse;

  set githubSignInResponse(NetworkDataResponse<UserCredential> value) {
    _githubSignInResponse = value;
    notifyListeners();
  }

  gitHubSignIn() async {
    githubSignInResponse = NetworkDataResponse.loading("Processing");
    try {
      var resp = await authRepo.githubSignIn();
      githubSignInResponse = NetworkDataResponse.completed(resp);
    } on FirebaseAuthException catch (e) {
      githubSignInResponse = NetworkDataResponse.error(e.message.toString());
      AppToast.showFlashToast(e.message.toString());
    } catch (e) {
      githubSignInResponse = NetworkDataResponse.error(e.toString());
      AppToast.showFlashToast(e.toString());
    }
  }

  googleSignIn() async {
    googleSignInResponse = NetworkDataResponse.loading("Processing");
    try {
      var resp = await authRepo.googleSignIn();
      googleSignInResponse = NetworkDataResponse.completed(resp);
    } on FirebaseAuthException catch (e) {
      googleSignInResponse = NetworkDataResponse.error(e.message.toString());
      AppToast.showFlashToast(e.message.toString());
    } catch (e) {
      googleSignInResponse = NetworkDataResponse.error(e.toString());
      AppToast.showFlashToast(e.toString());
    }
  }
}
