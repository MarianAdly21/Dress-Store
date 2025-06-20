import 'package:dress_store/features/sign_up/screen/sign_up_screen.dart';
import 'package:dress_store/features/welcome/bloc/welcom_screen_bloc.dart';
import 'package:dress_store/widgets/button_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WelcomScreenBloc(),
      child: const WelcomeScreenWithBloc(),
    );
  }
}

class WelcomeScreenWithBloc extends StatelessWidget {
  const WelcomeScreenWithBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/splash.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: BlocListener<WelcomScreenBloc, WelcomScreenState>(
              listener: (context, state) {
                if (state is NavigateToLoginScreenState) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const SignUpScreen();
                  }));
                }
                if (state is NavigateToSignUpScreenState) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const SignUpScreen();
                  }));
                }
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ButtonCustomWidget(
                        backgroundColor: Colors.black,
                        onTap: () {
                          context
                              .read<WelcomScreenBloc>()
                              .add(NavigateToSignUpScreenEvent());
                        },
                        text: "Sign Up"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ButtonCustomWidget(
                        onTap: () {
                          context
                              .read<WelcomScreenBloc>()
                              .add(NavigateToLoginScreenEvent());
                        },
                        text: "Login"),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
