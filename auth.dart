
import 'package:firebase_auth/firebase_auth.dart';
import 'package:furnitureshop/user.dart';
class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
   User _userFromFirebaseUser(FirebaseUser user){
    return user!=null ?User (uid:user.uid) :" no user" ;
   }


  // sign in with email and password

  Future signInEmailAndPass(String email, String password) async{
    try{
      AuthResult authResult = await _auth.signInWithEmailAndPassword(email: email.trim(), password: password);
      FirebaseUser firebaseUser = authResult.user;
      return _userFromFirebaseUser(firebaseUser);
    }catch(e){
      print(e);
    }

  }
// register with email and password

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      // registering user..
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(),
          password: password);
      FirebaseUser firebaseUser = authResult.user;
      return _userFromFirebaseUser(firebaseUser);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}