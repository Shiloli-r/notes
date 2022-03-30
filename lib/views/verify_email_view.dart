import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verify Your Email")),
      body: Column(children: [
        const Text(
            "We will send a verification link to the email address you provided"),
        TextButton(
          onPressed: () async {
            final user = FirebaseAuth.instance.currentUser;
            await user?.sendEmailVerification();
          },
          child: const Text("Send Verification Link"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/login/", (route) => false);
          },
          child: const Text("Log In"),
        ),
      ]),
    );
  }
}
