import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/routes/routes.dart';
import 'package:project/services/email.dart';
import 'package:project/services/google.dart';
import 'package:provider/provider.dart';

import '../../services/facebook.dart';
import '../auth/widgets/login_txt.dart';
import '../../view_model/auth_provider.dart';
import '../../components/custom_glow.dart';
import '../../core/style.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final google = GoogleService();
    final facebook = FacebookService();
    final email = EmailService();
    Size _size = MediaQuery.of(context).size;
    final provider = Provider.of<AuthProvider>(context);
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: ScrollConfiguration(
            behavior: NoGlow(),
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(_size.width * 0.1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "LOGIN",
                        style: TextStyle(fontSize: 24),
                      ),
                      const SizedBox(height: 50),
                      // >>> IMAGE <<<
                      SvgPicture.asset(
                        "assets/images/vector/login.svg",
                        height: _size.height * 0.2,
                        width: _size.width * 0.6,
                      ),
                      const SizedBox(height: 40),
                      // >>> EMAIL <<<
                      EmailLogin(controller: provider.emailLogin),
                      const SizedBox(height: 30),
                      // >>> PASSWORD <<<
                      PasswordLogin(controller: provider.passLogin),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () async {
                          await email
                              .signIn(
                                  email: provider.emailLogin.text,
                                  password: provider.passLogin.text)
                              .whenComplete(() {
                            provider.emailLogin.clear();
                            provider.passLogin.clear();
                            Navigator.pushReplacementNamed(
                                context, Routes.main);
                          });
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(_size.width, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "OR",
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: SizedBox(
                              height: _size.height * 0.04,
                              child: Image.asset("assets/images/google.png"),
                            ),
                            onTap: () async => await google.signIn().then(
                                  (_) => Navigator.pushReplacementNamed(
                                    context,
                                    Routes.main,
                                  ),
                                ),
                          ),
                          const SizedBox(width: 40),
                          GestureDetector(
                            child: SizedBox(
                              height: _size.height * 0.04,
                              child: Image.asset("assets/images/facebook.png"),
                            ),
                            onTap: () async => facebook.signIn().then(
                                  (_) => Navigator.pushReplacementNamed(
                                    context,
                                    Routes.main,
                                  ),
                                ),
                          ),
                          // Icon(Icons., color: Colors.white),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(text: "Don't have an Account ?"),
                            TextSpan(
                              text: "   Sign Up",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.pushNamed(
                                    context, Routes.register),
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Core.primary,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
