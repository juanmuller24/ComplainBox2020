import 'package:complainbox/backenddata.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';




class Auth{
  final FirebaseAuth _auth= FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn= GoogleSignIn();





  Future testSignInWithGoogle() async {

    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser
          .authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final FirebaseUser user = (await _auth.signInWithCredential(credential))
          .user;
      assert(user.email != null);
      assert(user.displayName != null);
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);

     //await BackendData(uid: user.uid).updateUserData('hello');


      return 0;
    }
    catch(e){
      print(e.toString());
      return null;
    }

  }


  Future signOutGmail() async{
    await _googleSignIn.signOut();
    return 0;
  }

}