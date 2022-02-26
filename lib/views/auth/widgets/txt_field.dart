import 'package:flutter/material.dart';

import '../../../core/style.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({
    Key? key,
    required this.label,
    required this.icon,
    required this.controller,
    required this.isLogin,
    required this.isPassword,
  }) : super(key: key);
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final bool isLogin;
  final bool isPassword;
  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  final FocusNode _focusNode = FocusNode();

  Color color = Colors.white;
  bool isFloating = false;
  bool isVisible = true;
  bool isError = false;
  String error = "";

  @override
  void initState() {
    _focusNode.addListener(
      () => setState(
        () {
          color = _focusNode.hasFocus ? Core.primary : Colors.white;
          isFloating =
              _focusNode.hasFocus ? isFloating = true : isFloating = false;
        },
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.text = "";
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isPassword ? isVisible : false,
      onChanged: widget.isPassword
          ? (!widget.isLogin &&
                  (widget.label == "Password" ||
                      widget.label == "Retype Password"))
              ? (val) {
                  setState(
                    () {
                      if (val.isNotEmpty && val.length < 6) {
                        isError = true;
                        error = "Password";
                      } else {
                        isError = false;
                      }
                    },
                  );
                }
              : null
          : (!widget.isLogin && widget.label == "Email")
              ? (val) {
                  setState(
                    () {
                      if (!val.contains("@")) {
                        isError = true;
                        error = "Email";
                      } else {
                        isError = false;
                      }
                    },
                  );
                }
              : null,
      controller: widget.controller,
      focusNode: _focusNode,
      decoration: InputDecoration(
        floatingLabelBehavior: isFloating
            ? FloatingLabelBehavior.auto
            : FloatingLabelBehavior.never,
        errorText: !widget.isLogin
            ? isError
                ? (error == "Password")
                    ? "Minimum 6 characters"
                    : "Email must contain @"
                : null
            : null,
        filled: true,
        fillColor: Core.primaryX,
        prefixIcon: Icon(
          widget.icon,
          color: color,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () => setState(
                  () {
                    isVisible = !isVisible;
                  },
                ),
                icon: isVisible
                    ? Icon(
                        Icons.visibility_off_rounded,
                        color: color,
                      )
                    : Icon(
                        Icons.visibility_rounded,
                        color: color,
                      ),
              )
            : null,
        label: Text(
          widget.label,
          style: const TextStyle(color: Colors.white),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.transparent)
        ), 
      ),
    );
  }
}
