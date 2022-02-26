import 'package:flutter/material.dart';
import 'package:project/views/auth/providers/txt_provider.dart';
import 'package:provider/provider.dart';

import '../components/custom_drop_down.dart';
import '../../../core/style.dart';

class MyDropDown extends StatelessWidget {
  const MyDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dropDown = Provider.of<AuthProvider>(context);
    Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        GestureDetector(
          onTap: () => dropDown.changeGender(""),
          child: TextField(
            enabled: false,
            decoration: InputDecoration(
              filled: true,
              fillColor: Core.primaryX,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
              ),
              prefixIcon: Icon(
                dropDown.icon,
                color: Colors.white,
              ),
              suffixIcon: AnimatedRotation(
                turns: dropDown.rotate,
                curve: Curves.linear,
                duration: const Duration(milliseconds: 100),
                child: const Icon(
                  Icons.arrow_drop_up_rounded,
                  color: Colors.white,
                ),
              ),
              label: Text(
                dropDown.gender,
                style: const TextStyle(color: Colors.white),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        if (dropDown.isShow)
          SizedBox(
            width: _size.width,
            child: CustomPaint(
              painter: DropDownShape(),
              child: Column(
                children: [
                  Theme(
                    data: ThemeData(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ListTile(
                        onTap: () {
                          dropDown.changeGender("Laki - laki");
                        },
                        leading: const Icon(
                          Icons.male_rounded,
                          color: Colors.white,
                        ),
                        title: const Text(
                          "Laki - laki",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Theme(
                    data: ThemeData(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                    child: ListTile(
                      onTap: () {
                        dropDown.changeGender("Perempuan");
                      },
                      leading:
                          const Icon(Icons.female_rounded, color: Colors.white),
                      title: const Text(
                        "Perempuan",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
      ],
    );
  }
}
