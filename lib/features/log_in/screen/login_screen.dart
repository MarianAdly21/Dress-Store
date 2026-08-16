import 'dart:developer';
import 'package:dress_store/features/Home/screens/home_screen.dart';
import 'package:dress_store/features/helper/show_snak_bar.dart';
import 'package:dress_store/features/log_in/bloc/login_screen_bloc.dart';
import 'package:dress_store/features/sign_up/screen/sign_up_screen.dart';
import 'package:dress_store/features/sign_up/widget/custom_text_field.dart';
import 'package:dress_store/res/app_color.dart';
import 'package:dress_store/widgets/auth_with_google_or_apple_custom_widet.dart';
import 'package:dress_store/widgets/base_auth_screen.dart';
import 'package:dress_store/widgets/button_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginScreenBloc(),
      child: const LogInScreenWithBloc(),
    );
  }
}

class LogInScreenWithBloc extends StatefulWidget {
  const LogInScreenWithBloc({super.key});

  @override
  State<LogInScreenWithBloc> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreenWithBloc> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email;
  String? password;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BaseAuthScreen(
      child: Scaffold(
        backgroundColor: AppColor.transparen,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: BlocListener<LoginScreenBloc, LoginScreenState>(
              listener: (context, state) {
                log('Current state: $state');
                if (state is ErrorState) {
                  isLoading = false;
                  showSnakBar(context, message: state.errorMessage);
                }
                if (state is LoadedState) {
                  isLoading = true;
                  log(isLoading.toString());
                }
                if (state is LoginSuccessfllyState) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const HomeScreen();
                  }));
                }
                if (state is OpenSignUpScreenState) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SignUpScreen();
                  }));
                }
              },
              child: BlocBuilder<LoginScreenBloc, LoginScreenState>(
                builder: (context, state) {
                  return _buildBody(context);
                },
              ),
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
              "Log into your account",
              style: TextStyle(
                fontSize: 40,
                color: AppColor.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CustomTextFormField(
            labelText: "Email",
            onChanged: (value) {
              email = value;
            },
            validator: _emailValidator,
          ),
          CustomTextFormField(
            isHidden: true,
            labelText: "Password",
            onChanged: (value) {
              password = value;
            },
            validator: _passwordValidator,
          ),
          SizedBox(height: 100.h),
          ButtonCustomWidget(
            isloading: isLoading,
            onTap: () {
              log(isLoading.toString());
              log("Button tapped");
              if (formKey.currentState!.validate()) {
                log("Form validated");
                currentBloc(context)
                    .add(ButtonLoginEvent(email: email!, password: password!));
                isLoading = false;
                log(isLoading.toString());
              } else {
                log("Form not valid");
              }
            },
            text: "Login",
          ),
          Padding(
            padding: EdgeInsets.only(top: 50.h, bottom: 90.h),
            child:
                const AuthWithGoogleOrAppleCustomWidet(text: "Or Login with:"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Don\'t have an account?',
                style: TextStyle(
                  color: AppColor.whiteColor,
                  fontSize: 18,
                ),
              ),
              GestureDetector(
                onTap: () {
                  currentBloc(context).add(OpenSignUpScreenEvent());
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: AppColor.whiteColor,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }

  // Widget _loginWithCustomWidget({required String text}) {
  //   return Center(
  //     child: Column(
  //       children: [
  //         Text(
  //           text,
  //           style: const TextStyle(
  //             fontSize: 20,
  //             color: AppColor.whiteColor,
  //           ),
  //         ),
  //         Row(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             _customIconButton(onTap: () {}, icon: Icons.g_mobiledata_sharp),
  //             _customIconButton(onTap: () {}, icon: Icons.apple),
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }

/////////////////////////////////////////////////////////////////
////////////////////helper method///////////////////////////////
////////////////////////////////////////////////////////////////
  LoginScreenBloc currentBloc(BuildContext context) =>
      context.read<LoginScreenBloc>();
  String? _passwordValidator(value) {
    if (value!.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  }

  String? _emailValidator(value) {
    if (value!.isEmpty) {
      return 'Please enter your email';
    }

    return null;
  }
}
