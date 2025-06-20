part of 'welcom_screen_bloc.dart';

@immutable
sealed class WelcomScreenState {}

final class WelcomScreenInitial extends WelcomScreenState {}

class NavigateToLoginScreenState extends WelcomScreenState{}
class NavigateToSignUpScreenState extends WelcomScreenState {}
