import 'package:flutter/material.dart';
import 'package:flutter_re_exam/view/home_screen.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';
import '../controller/home_controller.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    final AuthController authController = Get.put(AuthController());
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const Text(
              'Create Account',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Username',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.username,
              decoration: const InputDecoration(
                labelText: 'Create your username',
                labelStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(Icons.person_outline),
                border: InputBorder.none,
                filled: true,
                fillColor: Color(0xffFBFBFD),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Email or Phone Number',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.email,
              decoration: const InputDecoration(
                labelText: 'Enter your email or phone number',
                labelStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(Icons.mail_outline),
                border: InputBorder.none,
                filled: true,
                fillColor: Color(0xffFBFBFD),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Password',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.password,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Create your password',
                labelStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(Icons.lock_outline),
                suffixIcon: Icon(Icons.visibility_outlined),
                border: InputBorder.none,
                filled: true,
                fillColor: Color(0xffFBFBFD),
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Map m1 = {
                  'name': controller.username.text,
                  'password': controller.password.text,
                  'email': controller.email.text,
                };
                Get.off( HomeScreen());
                authController.Signup(
                    controller.email.text, controller.password.text);
              },
              child: Container(
                height: 60,
                width: 400,
                decoration: const BoxDecoration(
                  color: Colors.pink,
                ),
                child: const Center(
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Or using other method',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () async {},
              child: Container(
                height: 58,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Center(
                      child: Text(
                        '  Sign Up with Google',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100,left: 70),
              child: Row(
                children: [
                  Text('Already have account ?',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  Text(' login',style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold,fontSize: 20),),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
