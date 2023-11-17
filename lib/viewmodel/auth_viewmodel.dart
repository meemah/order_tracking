import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:order_tracking/repo/authentication_repo.dart';
import 'package:order_tracking/shared/locator.dart';
import 'package:order_tracking/shared/widgets/app_toast.dart';

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
    signInResponse = NetworkDataResponse.loading("");
    try {
      var resp = await authRepo.githubSignIn();
      signInResponse = NetworkDataResponse.completed(resp);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      signInResponse = NetworkDataResponse.error(e.message.toString());
      AppToast.showFlashToast(e.message.toString());
    } catch (e) {
      signInResponse = NetworkDataResponse.error(e.toString());
      AppToast.showFlashToast(e.toString());
    }
  }

  googleSignIn() async {
    signInResponse = NetworkDataResponse.loading("");
    try {
      var resp = await authRepo.googleSignIn();
      signInResponse = NetworkDataResponse.completed(resp);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      signInResponse = NetworkDataResponse.error(e.message.toString());
      AppToast.showFlashToast(e.message.toString());
    } catch (e) {
      print(e.toString());
      signInResponse = NetworkDataResponse.error(e.toString());
      AppToast.showFlashToast(e.toString());
    }
  }
}

class FirebaseException implements Exception {
  late String message;
  FirebaseException.fromFirebase(FirebaseAuthException authException) {
    switch (authException.code) {
      case 'account-exists-with-different-credential':
        message = "The account already exists with a different credential.";
        break;
      case 'invalid-credential':
        message = "The account already exists with a different credential.";
        break;

      default:
        message = "Try again, Error occurred while using Sign-In.";
        break;
    }
  }
  @override
  String toString() => message;
}

// on DioError catch (e) {
//       final errorMessage = DioExceptions.fromDioError(e).toString();
//       throw errorMessage;
//     }

class NetworkDataResponse<T> {
  late Status status;
  T? data;
  late String message;
  NetworkDataResponse.idle() : status = Status.IDLE;

  NetworkDataResponse.loading(this.message) : status = Status.LOADING;

  NetworkDataResponse.completed(this.data) : status = Status.COMPLETED;

  NetworkDataResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

// ignore: constant_identifier_names
enum Status { LOADING, COMPLETED, ERROR, IDLE }
