import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //signup
  Future register(String name,String pass) async{
    try{
      final result = await _auth.createUserWithEmailAndPassword(email: name, password: pass);

          print(result);return result;
    }
    catch(e){
      return null;
    }
  }

}