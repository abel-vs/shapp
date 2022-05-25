import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shapp/pages/verify_page.dart';
import 'package:shapp/services/database.dart';

abstract class AuthBase {
  Stream<User> get onAuthStateChanged;

  Future<User> currentUser();

  Future<User> signInAnonymously();

  Future<void> verifyPhone(PhoneNumber phoneNumber, BuildContext context);

  Future<User> signIn(String otp);

  Future<void> signOut();
}

class Auth implements AuthBase {
  final auth = FirebaseAuth.instance;
  String verificationId;

  @override
  Stream<User> get onAuthStateChanged {
    return auth.authStateChanges();
  }

  @override
  Future<User> currentUser() async {
    return auth.currentUser;
  }

  @override
  Future<User> signInAnonymously() async {
    final authResult = await auth.signInAnonymously();
    return authResult.user;
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }

  @override
  Future<void> verifyPhone(
      PhoneNumber phoneNumber, BuildContext context) async {
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber.phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // ANDROID ONLY!
        // Sign the user in (or link) with the auto-generated credential
        await auth
            .signInWithCredential(credential)
            .whenComplete(() => FirestoreDatabase().makeUser());

        Navigator.of(context).popUntil((route) => route.isFirst);
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(exceptionText(e.code)),
            backgroundColor: Colors.redAccent,
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId = verificationId;
      },
      codeSent: (String verificationId, int resendToken) async {
        this.verificationId = verificationId;
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => VerifyPage(phoneNumber: phoneNumber),
          ),
        );
      },
    );
  }

  @override
  Future<User> signIn(String otp) async {
    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp);
    // Sign the user in (or link) with the credential
    final authResult = await auth
        .signInWithCredential(phoneAuthCredential)
        .whenComplete(() => FirestoreDatabase().makeUser()); // Return the user
    // Return the user
    return authResult.user;
  }

  String exceptionText(String code) {
    switch (code) {
      case 'invalid-phone-number':
        return "The provided phone number is not valid.";
        break;
      case 'network-request-failed':
        return "No internet connection.";
        break;
      default:
        return "An exception occured: " + code;
    }
  }
}
