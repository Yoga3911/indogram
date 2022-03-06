import 'package:flutter/material.dart';
import '../views/auth/login.dart';
import '../views/auth/register.dart';
import '../views/profile/profile.dart';
import '../views/introduction/introduction.dart';
import '../views/main/main_page.dart';
import '../views/more/settings.dart';

abstract class Routes {
  Routes._();

  static const String introduction = "/introduction";
  static const String login = "/auth/login";
  static const String register = "/auth/register";
  static const String profile = "/user/profile";
  static const String main = "/user/main";
  static const String setting = "/user/setting";

  static final routes = <String, WidgetBuilder>{
    introduction: (context) => const IntroductionPage(),
    login: (context) => const Login(),
    register: (context) => const Register(),
    profile: (context) => const ProfilePage(),
    main: (context) => const MainPage(),
    setting: (context) => const SettingsPage(),
  };
}
