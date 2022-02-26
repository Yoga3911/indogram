import 'export.dart';

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
