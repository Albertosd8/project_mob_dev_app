import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserAuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // true -> go home page
  // false -> go login page
  bool isAlreadyAuthenticated() {
    return _auth.currentUser != null;
  }

  Future<void> signOutGoogleUser() async {
    await _googleSignIn.signOut();
  }

  Future<void> signOutFirebaseUser() async {
    await _auth.signOut();
  }

  Future<void> signInWithGoogle() async {
    //Google sign in
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;

    print(">> User email:${googleUser.email}");
    print(">> User name:${googleUser.displayName}");
    print(">> User photo:${googleUser.photoUrl}");
    //print(">> User photo:${googleUser.uid}");

    // credenciales de usuario autenticado con Google
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    print('------------------------------------------------------1');
    // firebase sign in con credenciales de Google
    final authResult = await _auth.signInWithCredential(credential);
    print('------------------------------------------------------2');

    // Extraer token**
    // User user = authResult.user!;
    // final firebaseToken = await user.getIdToken();
    // print("user fcm token:${firebaseToken}");

    // crear tabla user en firebase cloudFirestore y agregar valor fotoListId []
    await _createUserCollectionFirebase(_auth.currentUser!.uid,
        googleUser.email, googleUser.displayName, googleUser.photoUrl);
    print('------------------------------------------------------3');
  }

  Future<void> _createUserCollectionFirebase(
      String uid, String email, String? img, String? nombre) async {
    var userDoc =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();
    print('------------------------------------------------------2.5');
    // Si no exite el doc, lo crea con valor default lista vacia
    if (!userDoc.exists) {
      await FirebaseFirestore.instance.collection("users").doc(uid).set(
        {
          "email": email,
          "id_user": uid,
          "img": img,
          "nombre": nombre,
        },
      );
      print('------------------------------------------------------3.5');
    } else {
      // Si ya existe el doc return
      return;
    }
  }
}
