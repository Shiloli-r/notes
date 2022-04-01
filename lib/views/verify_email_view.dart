import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes/constants/routes.dart';

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
        const Text("We've sent a verification link to your email address"),
        const Text("Click the link below if you have not received the link"),
        TextButton(
          onPressed: () async {
            final user = FirebaseAuth.instance.currentUser;
            await user?.sendEmailVerification();
          },
          child: const Text("Send Verification Link"),
        ),
        TextButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.of(context).pushNamedAndRemoveUntil(
              loginRoute,
              (route) => false,
            );
          },
          child: const Text("Log In"),
        ),
      ]),
    );
  }
}
