import 'package:flutter/material.dart';

import '../../../core/style.dart';

// >>> NAME <<<
class NameRegister extends StatefulWidget {
  const NameRegister({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  _NameRegisterState createState() => _NameRegisterState();
}

class _NameRegisterState extends State<NameRegister> {
  final FocusNode _focusNode = FocusNode();

  Color color = Colors.white;
  bool isFloating = false;
  bool isError = false;

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
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: _focusNode,
      onChanged: (val) => setState(
        () {
          if (val.length > 20) {
            isError = true;
          } else {
            isError = false;
          }
        },
      ),
      decoration: InputDecoration(
        floatingLabelBehavior: isFloating
            ? FloatingLabelBehavior.auto
            : FloatingLabelBehavior.never,
        filled: true,
        fillColor: Core.primaryX,
        prefixIcon: Icon(
          Icons.person_rounded,
          color: color,
        ),
        label: const Text(
          "Name",
          style: TextStyle(color: Colors.white),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        errorText: isError ? "Maximum 20 character" : null,
      ),
    );
  }
}

// >>> EMAIL <<<
class EmailRegister extends StatefulWidget {
  const EmailRegister({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  _EmailRegisterState createState() => _EmailRegisterState();
}

class _EmailRegisterState extends State<EmailRegister> {
  final FocusNode _focusNode = FocusNode();

  Color color = Colors.white;
  bool isFloating = false;
  bool isError = false;

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
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: _focusNode,
      onChanged: (val) => setState(
        () {
          if (!val.contains("@")) {
            isError = true;
          } else {
            isError = false;
          }
        },
      ),
      decoration: InputDecoration(
        floatingLabelBehavior: isFloating
            ? FloatingLabelBehavior.auto
            : FloatingLabelBehavior.never,
        filled: true,
        fillColor: Core.primaryX,
        prefixIcon: Icon(
          Icons.email_rounded,
          color: color,
        ),
        label: const Text(
          "Email",
          style: TextStyle(color: Colors.white),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        errorText: isError ? "Email must contain @" : null,
      ),
    );
  }
}

// >>> PASSWORD 1 <<<
class Password1Register extends StatefulWidget {
  const Password1Register({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  _Password1RegisterState createState() => _Password1RegisterState();
}

class _Password1RegisterState extends State<Password1Register> {
  final FocusNode _focusNode = FocusNode();

  Color color = Colors.white;
  bool isFloating = false;
  bool isError = false;
  bool isVisible = false;

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
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: _focusNode,
      obscureText: !isVisible,
      onChanged: (val) => setState(() {
        if (val.length < 6) {
          isError = true;
        } else {
          isError = false;
        }
      }),
      decoration: InputDecoration(
        floatingLabelBehavior: isFloating
            ? FloatingLabelBehavior.auto
            : FloatingLabelBehavior.never,
        filled: true,
        fillColor: Core.primaryX,
        prefixIcon: Icon(
          Icons.lock_rounded,
          color: color,
        ),
        suffixIcon: IconButton(
          onPressed: () => setState(() => isVisible = !isVisible),
          icon: isVisible
              ? Icon(
                  Icons.visibility_rounded,
                  color: color,
                )
              : Icon(
                  Icons.visibility_off_rounded,
                  color: color,
                ),
        ),
        suffixIconColor: color,
        label: const Text(
          "Password",
          style: TextStyle(color: Colors.white),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        errorText: isError? "Password minimum 6 character" : null,
      ),
    );
  }
}

// >>> PASSWORD 2 <<<
class Password2Register extends StatefulWidget {
  const Password2Register({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  _Password2RegisterState createState() => _Password2RegisterState();
}

class _Password2RegisterState extends State<Password2Register> {
  final FocusNode _focusNode = FocusNode();

  Color color = Colors.white;
  bool isFloating = false;
  bool isError = false;
  bool isVisible = false;

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
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: _focusNode,
      obscureText: !isVisible,
      onChanged: (val) => setState(() {
        if (val.length < 6) {
          isError = true;
        } else {
          isError = false;
        }
      }),
      decoration: InputDecoration(
        floatingLabelBehavior: isFloating
            ? FloatingLabelBehavior.auto
            : FloatingLabelBehavior.never,
        filled: true,
        fillColor: Core.primaryX,
        prefixIcon: Icon(
          Icons.lock_rounded,
          color: color,
        ),
        suffixIcon: IconButton(
          onPressed: () => setState(() => isVisible = !isVisible),
          icon: isVisible
              ? Icon(
                  Icons.visibility_rounded,
                  color: color,
                )
              : Icon(
                  Icons.visibility_off_rounded,
                  color: color,
                ),
        ),
        suffixIconColor: color,
        label: const Text(
          "Retype Password",
          style: TextStyle(color: Colors.white),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        errorText: isError? "Password minimum 6 character" : null,
      ),
    );
  }
}
