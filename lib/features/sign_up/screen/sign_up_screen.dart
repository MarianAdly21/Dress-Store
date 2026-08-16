import 'dart:developer';

import 'package:dress_store/features/Home/screens/home_screen.dart';
import 'package:dress_store/features/helper/show_snak_bar.dart';
import 'package:dress_store/features/log_in/screen/login_screen.dart';
import 'package:dress_store/features/sign_up/bloc/sign_up_bloc.dart';
import 'package:dress_store/features/sign_up/widget/custom_text_field.dart';
import 'package:dress_store/res/app_color.dart';
import 'package:dress_store/widgets/auth_with_google_or_apple_custom_widet.dart';
import 'package:dress_store/widgets/base_auth_screen.dart';
import 'package:dress_store/widgets/button_custom_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: const SignUpScreenWithBloc(),
    );
  }
}

class SignUpScreenWithBloc extends StatefulWidget {
  const SignUpScreenWithBloc({super.key});

  @override
  State<SignUpScreenWithBloc> createState() => _SignUpScreenWithBlocState();
}

class _SignUpScreenWithBlocState extends State<SignUpScreenWithBloc> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email;
  String? password;
  String? name;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BaseAuthScreen(
      child: Scaffold(
        backgroundColor: AppColor.transparen,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: BlocListener<SignUpBloc, SignUpState>(
              listener: (context, state) {
                log('Current state: $state');
                if (state is ErrorSignUpState) {
                  _isLoading = false;
                  showSnakBar(context, message: state.errorMessage);
                }
                if (state is LoadingSignUpState) {
                  _isLoading = true;
                  log("$state------ ${_isLoading.toString()}");
                }
                if (state is SuccessuflySignUpState) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const HomeScreen();
                  }));
                }
                if (state is NavigatorToLogInScreenState) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LoginScreen();
                  }));
                }
              },
              child: _buildBody(context),
            ),
          ),
        ),
      ),
    );
  }

  /////////////////////////////////////////////////////////////////
////////////////////helper Widget///////////////////////////////
////////////////////////////////////////////////////////////////

  Widget _buildBody(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60.h),
            child: const Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 40,
                color: AppColor.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CustomTextFormField(
              validator: _nameValidatro,
              onChanged: (value) {
                name = value;
              },
              labelText: "Full Name"),
          CustomTextFormField(
              validator: _emailValidatro,
              onChanged: (value) {
                email = value;
              },
              labelText: "Email"),
          CustomTextFormField(
              validator: _passwordValidator,
              onChanged: (value) {
                password = value;
              },
              isHidden: true,
              labelText: "Password"),
          CustomTextFormField(
            validator: (value) {
              if (value != password) {
                return 'Please enter your Password Correctlly';
              }
              return null;
            },
            isHidden: true,
            labelText: "ReEnter your Password",
          ),
          SizedBox(height: 36.h),
          ButtonCustomWidget(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  _currentBloc.add(
                      SignUpClickedEvent(email: email!, password: password!));
                } else {}
              },
              text: "Sign Up"),
          _signUpWith(),
          _alreadyHaveAccount(context),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }

  Widget _alreadyHaveAccount(BuildContext context) {
    return Row(
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
            // Navigator.pop(context);
            _currentBloc.add(NavigatorToLogInScreenEvent());
          },
          child: const Text(
            'Log in',
            style: TextStyle(
              color: AppColor.whiteColor,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }

  Widget _signUpWith() {
    return Padding(
      padding: EdgeInsets.only(top: 36.h, bottom: 90.h),
      child: const AuthWithGoogleOrAppleCustomWidet(text: "Or Sign Up with:"),
    );
  }

/////////////////////////////////////////////////////////////////
////////////////////helper method///////////////////////////////
////////////////////////////////////////////////////////////////
  SignUpBloc get _currentBloc => context.read<SignUpBloc>();
  String? _passwordValidator(value) {
    if (value!.isEmpty) {
      return 'Please enter your email';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? _emailValidatro(value) {
    if (value!.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegEx = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegEx.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _nameValidatro(value) {
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
    return null;
  }
}
