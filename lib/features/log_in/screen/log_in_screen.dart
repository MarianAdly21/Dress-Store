import 'package:dress_store/features/sign_up/screen/sign_up_screen.dart';
import 'package:dress_store/features/sign_up/widget/custom_text_field.dart';
import 'package:dress_store/widgets/button_custom_widget.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
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
              child: ListView(
                children: [
                  Form(
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
                        const CustomTextFormField(labelText: "User Name/Email"),
                        const CustomTextFormField(
                            isHidden: true, labelText: "Password"),
                        const SizedBox(height: 100),
                        ButtonCustomWidget(onTap: () {}, text: "Login"),
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
                                  return SignUpScreen();
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
