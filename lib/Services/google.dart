import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googlesignin = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleuser = await googlesignin.signIn();
      print(googleuser);
      if (googleuser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleuser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      UserCredential userCredential =
          await auth.signInWithCredential(credential);

      return userCredential.user;
    } catch (e) {
      print("Error is $e");
      return null;
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
    await googlesignin.signOut();
  }
}
