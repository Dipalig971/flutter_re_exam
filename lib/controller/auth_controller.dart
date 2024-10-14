
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/auth_services.dart';
import '../view/home_screen.dart';


class AuthController extends GetxController {
  var userName = ''.obs;
  var userEmail = ''.obs;

  void method(String email,String username){
    userName.value = username;
    userEmail.value = email;
  }

  Future<void> Signup(String email, String password) async {

    try {
      bool emails = await AuthServices.authServices.CheckEmail(email);
      if (emails) {
        Get.snackbar(
          'Sign Up Failed',
          'Email already in use. Please use a different email.',
        );
      } else {
        await AuthServices.authServices.CreateAccount(email, password);
        Get.snackbar(
          'Sign Up',
          'Sign Up Successfully',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Sign Up Failed',
        e.toString(),
      );
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      User? user = await AuthServices.authServices.Signin(email, password);
      if (user != null && user.emailVerified) {
        Get.to(HomeScreen());
      } else if (user != null && !user.emailVerified) {
        Get.snackbar(
          'Login Failed',
          'Please verify your email before logging in.',
        );
      } else {
        Get.snackbar(
          'Login Failed',
          'Incorrect email or password.',

        );
      }
    } catch (e) {
      Get.snackbar(
        'Login Failed',
        e.toString(),

      );
    }
  }

  void emailLogOut() {
    AuthServices.authServices.signout();
  }
}