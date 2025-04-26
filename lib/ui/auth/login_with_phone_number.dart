import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/ui/auth/verify_code.dart';
import 'package:flutter_notes/utils/utils.dart';
import 'package:flutter_notes/widgets/round_button.dart';

class LoginWithPhoneNumber extends StatefulWidget {
  const LoginWithPhoneNumber({super.key});

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {
  bool loading = false;
  final phoneNumberController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 80),
            TextFormField(
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: '+1 234 3455 234',
              ),
            ),
            const SizedBox(height: 80),
            RoundButton(
              title: 'Login',
              loading: loading,
              onTap: () {
                setState(() {
                  loading = true;
                });
                _auth.verifyPhoneNumber(
                  phoneNumber: phoneNumberController.text,
                  verificationCompleted: (PhoneAuthCredential credential) {
                    setState(() {
                      loading = false;
                    });
                  },
                  verificationFailed: (FirebaseAuthException e) {
                    setState(() {
                      loading = false;
                    });
                    Utils().toastMessage(e.toString());
                  },
                  codeSent: (String verificationId, int? token) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerifyCode(
                          verificationId: verificationId,
                        ),
                      ),
                    );
                    setState(() {
                      loading = false;
                    });
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {
                    Utils().toastMessage('Code retrieval timeout.');
                    setState(() {
                      loading = false;
                    });
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
