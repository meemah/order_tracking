import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthRepo {
  Future<UserCredential> googleSignIn();
  Future<UserCredential> githubSignIn();
}

class AuthRepoImpl extends AuthRepo {
  @override
  Future<UserCredential> githubSignIn() async {
    GithubAuthProvider githubProvider = GithubAuthProvider();
    return await FirebaseAuth.instance.signInWithProvider(githubProvider);
  }

  @override
  Future<UserCredential> googleSignIn() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
