import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_otp_verification/phone_verification.dart';
import 'package:winter_food/controllers/phone_verification_controller.dart';
import 'package:winter_food/services/verification_services.dart';
import 'package:winter_food/utils/constants/constants.dart';

class PhoneVerificationPage extends StatefulWidget {
  const PhoneVerificationPage({super.key});

  @override
  State<PhoneVerificationPage> createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
  final VerificationServices _verificationServices = VerificationServices();

  String _verificationId = '';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PhoneVeficationController());
    return PhoneVerification(
      isFirstPage: false,
      enableLogo: false,
      themeColor: kPrimary,
      backgroundColor: kLightWhite,
      initialPageText: "Verify Phone Number",
      initialPageTextStyle: const TextStyle(
        color: kPrimary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      textColor: kDark,
      onSend: (String value) {
        controller.phoneNumber = value;
        _verifyPhoneNumber(value);
      },
      onVerification: (String value) {
        _submitVerificationCode(value);
      },
    );
  }

  void _verifyPhoneNumber(String phoneNumber) async {
    final controller = Get.find<PhoneVeficationController>();

    await _verificationServices.verifyPhoneNumber(controller.phoneNumber,
        codeSent: (String verificationId, int? resendToken) {
      setState(() {
        _verificationId = verificationId;
      });
    });
  }

  void _submitVerificationCode(String code) async {
    await _verificationServices.verifySMSCode(_verificationId, code);
  }
}
