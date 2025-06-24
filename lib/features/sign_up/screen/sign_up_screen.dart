import 'dart:developer';

import 'package:dress_store/features/sign_up/widget/custom_text_field.dart';
import 'package:dress_store/widgets/button_custom_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email;
  String? password;
  String? name;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/splash.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.only(right: 50),
          decoration: BoxDecoration(
            color: const Color(0xffF8A3A7).withOpacity(0.8),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 60),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      CustomTextFormField(
                          validato: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name';
                            }
                            if (value.trim().length < 2) {
                              return 'Name must be at least 2 characters';
                            }
                            final nameRegex = RegExp(r'^[a-zA-Z\s]+$');
                            if (!nameRegex.hasMatch(value)) {
                              return 'Name can only contain letters and spaces';
                            }
                          },
                          onChanged: (value) {
                            name = value;
                          },
                          labelText: "Full Name"),
                      CustomTextFormField(
                          validato: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            final emailRegEx =
                                RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                            if (!emailRegEx.hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                          },
                          onChanged: (value) {
                            email = value;
                          },
                          labelText: "Email"),
                      CustomTextFormField(
                          validato: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                          },
                          onChanged: (value) {
                            password = value;
                          },
                          isHidden: true,
                          labelText: "Password"),
                      CustomTextFormField(
                          validato: (value) {
                            if (value != password) {
                              return 'Please enter your Password Correctlly';
                            }
                          },
                          isHidden: true,
                          labelText: "Reenter your Password"),
                      const SizedBox(height: 36),
                      ButtonCustomWidget(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              try {
                                UserCredential user = await FirebaseAuth
                                    .instance
                                    .createUserWithEmailAndPassword(
                                        email: email!, password: password!);
                                showSnakBar(context, message: "Success");
                              } on FirebaseAuthException catch (e) {
                                if (e.code == "weak-password") {
                                  showSnakBar(context,
                                      message:
                                          'The password provided is too weak.');
                                } else if (e.code == 'email-already-in-use') {
                                  showSnakBar(context,
                                      message:
                                          'The account already exists for that email.');
                                }
                              } catch (e) {
                                showSnakBar(context, message: e.toString());
                              }
                            } else {}
                          },
                          text: "Sign Up"),
                      const SizedBox(height: 36),
                      Center(
                        child: Column(
                          children: [
                            const Text(
                              "Or Sign Up with:",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.g_mobiledata_sharp),
                                  iconSize: 26,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.apple),
                                  iconSize: 26,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 90),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Log in',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void showSnakBar(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
