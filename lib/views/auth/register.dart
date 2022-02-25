import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/views/auth/login.dart';
import 'package:project/views/auth/providers/txt_provider.dart';
import 'package:project/views/auth/widgets/drop_down.dart';
import 'package:project/views/auth/widgets/txt_field.dart';
import 'package:provider/provider.dart';

import '../../components/custom_glow.dart';
import '../../core/style.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final txt = Provider.of<MyTextEditing>(context);
    Size _size = MediaQuery.of(context).size;
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
                        "REGISTER",
                        style: TextStyle(fontSize: 24),
                      ),
                      const SizedBox(height: 50),
                      // >>> IMAGE <<<
                      SvgPicture.asset(
                        "assets/images/register.svg",
                        width: _size.width * 0.6,
                        height: _size.height * 0.2,
                      ),
                      const SizedBox(height: 40),
                      // >>> NAME <<<
                      MyTextField(
                        label: "Name",
                        icon: Icons.person_rounded,
                        controller: txt.nameRegis,
                        isLogin: false,
                        isPassword: false,
                      ),
                      const SizedBox(height: 30),
                      // >>> EMAIL <<<
                      MyTextField(
                        label: "Email",
                        icon: Icons.email_rounded,
                        controller: txt.emailRegis,
                        isLogin: false,
                        isPassword: false,
                      ),
                      const SizedBox(height: 30),
                      // >>> PASSWORD <<<
                      MyTextField(
                        label: "Password",
                        icon: Icons.lock_rounded,
                        controller: txt.pass1Regis,
                        isLogin: false,
                        isPassword: true,
                      ),
                      const SizedBox(height: 30),
                      // >>> RETYPE PASSWORD <<<
                      MyTextField(
                        label: "Retype Password",
                        icon: Icons.lock_rounded,
                        controller: txt.pass2Regis,
                        isLogin: false,
                        isPassword: true,
                      ),
                      const SizedBox(height: 30),
                      // >>> DROP DOWN <<<
                      const MyDropDown(),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Login(),
                            ),
                          );
                        },
                        child: const Text("Sign Up"),
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
    );
  }
}
