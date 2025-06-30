import 'dart:developer';
import 'package:dress_store/features/Home/screens/home_screen.dart';
import 'package:dress_store/features/helper/show_snak_bar.dart';
import 'package:dress_store/features/log_in/bloc/login_screen_bloc.dart';
import 'package:dress_store/features/sign_up/screen/sign_up_screen.dart';
import 'package:dress_store/features/sign_up/widget/custom_text_field.dart';
import 'package:dress_store/widgets/button_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          width: MediaQuery.of(context).size.width - 50,
          // margin: const EdgeInsets.only(right: 50),
          decoration: BoxDecoration(
            color: const Color(0xffF8A3A7).withOpacity(0.8),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext) {
                        return const HomeScreen();
                      }));
                    }
                  },
                  child: BlocBuilder<LoginScreenBloc, LoginScreenState>(
                    builder: (context, state) {
                      return Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 60),
                              child: Text(
                                "Log into your account",
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            CustomTextFormField(
                              labelText: "Email",
                              onChanged: (value) {
                                email = value;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your email';
                                }

                                return null;
                              },
                            ),
                            CustomTextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your email';
                                }

                                return null;
                              },
                              isHidden: true,
                              labelText: "Password",
                              onChanged: (value) {
                                password = value;
                              },
                            ),
                            const SizedBox(height: 100),
                            ButtonCustomWidget(
                                isloading: isLoading,
                                onTap: () {
                                  log(isLoading.toString());
                                  log("Button tapped");
                                  if (formKey.currentState!.validate()) {
                                    log("Form validated");
                                    currentBloc(context).add(ButtonLoginEvent(
                                        email: email!, password: password!));
                                    isLoading = false;
                                    log(isLoading.toString());
                                  } else {
                                    log("Form not valid");
                                  }
                                },
                                text: "Login"),
                            const SizedBox(height: 50),
                            Center(
                              child: Column(
                                children: [
                                  const Text(
                                    "Or Login with:",
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
                                        icon: const Icon(
                                            Icons.g_mobiledata_sharp),
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
                                  'Don\'t have an account?',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const SignUpScreen();
                                    }));
                                  },
                                  child: const Text(
                                    'Sign Up',
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
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  LoginScreenBloc currentBloc(BuildContext context) =>
      context.read<LoginScreenBloc>();
}
