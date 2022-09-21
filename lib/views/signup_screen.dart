import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/firebase_auth_controller.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  final controller = Get.put(FirebaseAuthController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Page'),
      ),
      body: Column(children: [
        TextField(
          controller: controller.emailController,
          decoration: const InputDecoration(labelText: 'Email'),
        ),
        TextField(
          controller: controller.passwordController,
          decoration: const InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: (() => controller.signUp(controller.emailController.text,
                controller.passwordController.text)),
            child: const Text('Sign Up'))
      ]),
    ));
  }
}
