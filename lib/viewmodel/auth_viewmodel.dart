import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:order_tracking/repo/authentication_repo.dart';
import 'package:order_tracking/shared/locator.dart';
import 'package:order_tracking/shared/widgets/app_toast.dart';

import '../shared/utils/network_helper/network_data_response.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepo authRepo = serviceLocator<AuthRepo>();
  NetworkDataResponse<UserCredential> _signInResponse =
      NetworkDataResponse.idle();

  NetworkDataResponse<UserCredential> get signInResponse => _signInResponse;

  set signInResponse(NetworkDataResponse<UserCredential> value) {
    _signInResponse = value;
    notifyListeners();
  }

  gitHubSignIn() async {
    signInResponse = NetworkDataResponse.loading("Processing");
    try {
      var resp = await authRepo.githubSignIn();
      signInResponse = NetworkDataResponse.completed(resp);
    } on FirebaseAuthException catch (e) {
      signInResponse = NetworkDataResponse.error(e.message.toString());
      AppToast.showFlashToast(e.message.toString());
    } catch (e) {
      signInResponse = NetworkDataResponse.error(e.toString());
      AppToast.showFlashToast(e.toString());
    }
  }

  googleSignIn() async {
    signInResponse = NetworkDataResponse.loading("Processing");
    try {
      var resp = await authRepo.googleSignIn();
      signInResponse = NetworkDataResponse.completed(resp);
    } on FirebaseAuthException catch (e) {
      signInResponse = NetworkDataResponse.error(e.message.toString());
      AppToast.showFlashToast(e.message.toString());
    } catch (e) {
      signInResponse = NetworkDataResponse.error(e.toString());
      AppToast.showFlashToast(e.toString());
    }
  }
}
