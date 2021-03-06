import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/routes/routes.dart';
import 'package:project/services/email.dart';
import 'package:project/services/facebook.dart';
import 'package:project/services/google.dart';
import 'package:project/views/auth/widgets/register_txt.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/custom_glow.dart';
import '../../core/style.dart';
import '../../view_model/auth_provider.dart';
import 'widgets/drop_down.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);
    Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          provider.nameRegis.clear();
          provider.emailRegis.clear();
          provider.pass1Regis.clear();
          provider.pass2Regis.clear();
          return true;
        },
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
                          "REGISTER",
                          style: TextStyle(fontSize: 24),
                        ),
                        const SizedBox(height: 50),
                        // >>> IMAGE <<<
                        SvgPicture.asset(
                          "assets/images/vector/register.svg",
                          width: _size.width * 0.6,
                          height: _size.height * 0.2,
                        ),
                        const SizedBox(height: 40),
                        // >>> NAME <<<
                        NameRegister(controller: provider.nameRegis),
                        const SizedBox(height: 30),
                        // >>> EMAIL <<<
                        EmailRegister(controller: provider.emailRegis),
                        const SizedBox(height: 30),
                        // >>> PASSWORD <<<
                        Password1Register(controller: provider.pass1Regis),
                        const SizedBox(height: 30),
                        // >>> RETYPE PASSWORD <<<
                        Password2Register(controller: provider.pass2Regis),
                        const SizedBox(height: 30),
                        // >>> DROP DOWN <<<
                        const MyDropDown(),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () async {
                            await EmailService.signUp(
                                email: provider.emailRegis.text,
                                password: provider.pass1Regis.text);
                            provider.nameRegis.clear();
                            provider.emailRegis.clear();
                            provider.pass1Regis.clear();
                            provider.pass2Regis.clear();
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              Routes.login,
                              (route) => false,
                            );
                          },
                          child: const Text(
                            "Sign Up",
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
                              onTap: () => GoogleService.signIn().then(
                                (user) async {
                                  final pref =
                                      await SharedPreferences.getInstance();
                                  pref.setString(
                                    "social",
                                    "google",
                                  );
                                  Navigator.pushReplacementNamed(
                                    context,
                                    Routes.main,
                                    arguments: user,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 40),
                            GestureDetector(
                              child: SizedBox(
                                height: _size.height * 0.04,
                                child:
                                    Image.asset("assets/images/facebook.png"),
                              ),
                              onTap: () => FacebookService.signIn().then(
                                (user) async {
                                  final pref =
                                      await SharedPreferences.getInstance();
                                  pref.setString(
                                    "social",
                                    "facebook",
                                  );
                                  Navigator.pushReplacementNamed(
                                    context,
                                    Routes.main,
                                    arguments: user,
                                  );
                                },
                              ),
                            ),
                            // Icon(Icons., color: Colors.white),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(text: "Already have an Account ?"),
                              TextSpan(
                                text: "   Sign In",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    provider.nameRegis.clear();
                                    provider.emailRegis.clear();
                                    provider.pass1Regis.clear();
                                    provider.pass2Regis.clear();
                                    Navigator.pop(context);
                                  },
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
      ),
    );
  }
}
