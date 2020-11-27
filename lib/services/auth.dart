import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase {
  Stream<User> get onAuthStateChanged;
  Future<User> currentUser();
  Future<User> signInAnonymously();
  Future<void> verifyPhone(String phoneNumber);
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
  Future<void> verifyPhone(String phoneNumber) async {
    print(phoneNumber);
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // ANDROID ONLY!
        // Sign the user in (or link) with the auto-generated credential
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
        // Handle other errors
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId = verificationId;
      },
      codeSent: (String verificationId, int resendToken) async {
        this.verificationId = verificationId;
      },
    );
  }

  @override
  Future<User> signIn(String otp) async {
    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: otp);
    // Sign the user in (or link) with the credential
    final authResult = await auth.signInWithCredential(phoneAuthCredential);
    // Return the user
    return authResult.user;
  }
}