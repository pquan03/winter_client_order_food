import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winter_food/common/snackbar_custom.dart';
import 'package:winter_food/controllers/phone_verification_controller.dart';

class VerificationServices {
  final controller = Get.put(PhoneVeficationController());
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> verifyPhoneNumber(String phoneNumber,
      {required Null Function(String verificationId, int? resendToken)
          codeSent}) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credentials) {},
        verificationFailed: (FirebaseException exception) {
          debugPrint(exception.message);
        },
        codeSent: (String verificationId, int? resendToken) {
          codeSent(verificationId, resendToken);
        },
        timeout: const Duration(seconds: 60),
        codeAutoRetrievalTimeout: (String verificationId) {
          debugPrint('Auto retrieval timeout');
        });
  }

  Future<void> verifySMSCode(String verificationId, String smsCode) async {
    final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    try {
      await _auth.signInWithCredential(credential);
      controller.verifyPhone();
    } catch(err) {
      WLoader.errorSnackBar(title: 'Error', message: err.toString());
    }
  }
}
