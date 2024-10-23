import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  AuthServices._();

  static signInWithGoogle() async {
    final GoogleSignInAccount? gUSer = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUSer!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    return userCredential.user;
  }

  static signOut() async {
    try {
      await FirebaseAuth.instance.signOut();

      await GoogleSignIn().disconnect();
      await GoogleSignIn().signOut();
      return true;
    } catch (e) {
      print("Error while signout!");
      return false;
    }
  }
}
