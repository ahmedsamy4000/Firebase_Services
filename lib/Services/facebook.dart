import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookAuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<UserCredential?> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        final OAuthCredential credential =
            FacebookAuthProvider.credential(accessToken.tokenString);
        return await auth.signInWithCredential(credential);
      } else {
        throw FirebaseAuthException(
            code: "Erorr Occured", message: "Sign In Failed");
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
