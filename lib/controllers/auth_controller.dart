import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_quiz_app/firebse_ref/references.dart';
import 'package:firebase_quiz_app/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../screens/login/login_screen.dart';
import '../widgets/dialogs/dialog_widget.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  late FirebaseAuth _auth;
  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen(
      (User? user) {
        _user.value = user;
      },
    );
    navigateToIntroduction();
  }

  signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await googleSignIn.signIn();
      if (account != null) {
        final authAccount = await account.authentication;
        final credential = GoogleAuthProvider.credential(
            idToken: authAccount.idToken, accessToken: authAccount.accessToken);
        await _auth.signInWithCredential(credential);
        await saveUser(account);
        navigateToHomePage();
      }
    } on Exception catch (err) {
      debugPrint(err.toString());
    }
  }

  saveUser(GoogleSignInAccount account) {
    userRf.doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "profilepic": account.photoUrl
    });
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      navigateToHomePage();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void navigateToIntroduction() {
    Get.offAllNamed('/introduction');
  }

  void showLoginAlertDialog() {
    Get.dialog(Dialogs.questionStarDialog(onTap: () {
      Get.back();
      navigateToLoginPage();
    }), barrierDismissible: false);
  }

  void navigateToLoginPage() {
    Get.toNamed(LoginScreen.routeName);
  }

  User? getUser() {
    _user.value = _auth.currentUser;
    return _user.value;
  }

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }

  void navigateToHomePage() {
    Get.offAllNamed(HomeScreen.routeName);
  }
}
