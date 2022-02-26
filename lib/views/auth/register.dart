import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/views/auth/widgets/register_txt.dart';
import 'package:provider/provider.dart';

import '../../components/custom_glow.dart';
import '../../core/style.dart';
import 'providers/txt_provider.dart';
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
                          onPressed: () {
                            provider.nameRegis.clear();
                            provider.emailRegis.clear();
                            provider.pass1Regis.clear();
                            provider.pass2Regis.clear();
                            Navigator.pushReplacementNamed(
                                context, "/auth/login");
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
                            SizedBox(
                              height: _size.height * 0.04,
                              child: Image.asset("assets/images/google.png"),
                            ),
                            const SizedBox(width: 40),
                            SizedBox(
                              height: _size.height * 0.04,
                              child: Image.asset("assets/images/facebook.png"),
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
                                    color: Core.primary),
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
