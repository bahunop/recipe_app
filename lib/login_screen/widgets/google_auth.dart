import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth {
  signInwithGoogle() async {
//begin sign in

    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

//obtain details
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
//new credentails
    final gCredential = GoogleAuthProvider.credential(
        idToken: gAuth.idToken, accessToken: gAuth.accessToken);
//at last,sign in
    return await FirebaseAuth.instance.signInWithCredential(gCredential);
  }
}
