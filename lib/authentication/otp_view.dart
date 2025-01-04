import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  const OTPVerificationScreen({super.key, required this.phoneNumber});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String? _verificationId;
  final _pinController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _verifyPhoneNumber();
  }

  Future<void> _verifyPhoneNumber() async {
    String formattedPhoneNumber = widget.phoneNumber;

    // Ensure the number starts with a '+' and the country code
    if (!formattedPhoneNumber.startsWith('+')) {
      // If no '+' is present, assume Indian country code (+91)
      formattedPhoneNumber = '+91$formattedPhoneNumber';
    }

    await auth.verifyPhoneNumber(
      phoneNumber: formattedPhoneNumber, // Use the formatted number
      verificationCompleted: (PhoneAuthCredential credential) async {
        // ... (your existing verificationCompleted logic) ...
      },
      verificationFailed: (FirebaseAuthException e) {
        // ... (your existing verificationFailed logic) ...
      },
      codeSent: (String verificationId, int? resendToken) {
        // ... (your existing codeSent logic) ...
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // ... (your existing codeAutoRetrievalTimeout logic) ...
      },
    );
  }

  Future<void> _verifyOTP() async {
    if (_formKey.currentState!.validate()) {
      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId!,
          smsCode: _pinController.text,
        );
        await auth.signInWithCredential(credential);
        // Navigate to the next screen or show a success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('OTP verification successful!')),
        );
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? 'OTP verification failed')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Enter the OTP sent to ${widget.phoneNumber}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                Pinput(
                  controller: _pinController,
                  length: 6,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the OTP';
                    }
                    if (value.length < 6) {
                      return 'Please enter a valid 6-digit OTP';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _verifyOTP,
                  child: const Text('Verify OTP'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}