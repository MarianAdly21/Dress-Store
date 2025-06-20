part of 'welcom_screen_bloc.dart';

@immutable
sealed class WelcomScreenEvent {}
 class NavigateToLoginScreenEvent extends WelcomScreenEvent{} 
 class NavigateToSignUpScreenEvent extends WelcomScreenEvent {}
