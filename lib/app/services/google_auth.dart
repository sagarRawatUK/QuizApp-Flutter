import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  Future<User> signin() async {
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final UserCredential userCredential =
        await auth.signInWithCredential(credential);
    final User? user = userCredential.user;

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User? currentUser = auth.currentUser;
      assert(user.uid == currentUser!.uid);
    }
    return user!;
  }

  Future<void> signOut() async {
    await googleSignIn.signOut();
    print("User Signed Out");
  }

  String getCurrentUserId() {
    User user = auth.currentUser!;
    print(user.displayName);
    return user.uid;
  }
}
