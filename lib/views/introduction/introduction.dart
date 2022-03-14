import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:project/core/style.dart';

import '../../routes/routes.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    List<PageViewModel> pageView = [
      PageViewModel(
        title: "Indogram Chat",
        bodyWidget: const AutoSizeText(
          "Indogram adalah aplikasi mengirim pesan instan melalui perantara internet",
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 17),
        ),
        image: SvgPicture.asset(
          "assets/images/vector/chat3.svg",
          height: _size.height * 0.2,
          width: _size.width * 0.6,
        ),
      ),
      PageViewModel(
        title: "Indogram Group",
        bodyWidget: const AutoSizeText(
          "Anda dapat membuat grup dengan anggota tak terbatas menggunakan Indogram",
          style: TextStyle(
            fontSize: 17,
          ),
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        image: SvgPicture.asset(
          "assets/images/vector/chat2.svg",
          height: _size.height * 0.2,
          width: _size.width * 0.6,
        ),
      ),
      PageViewModel(
        title: "Indogram Call",
        bodyWidget: const AutoSizeText(
          "Tersedia fitur panggilan bagi sesama pengguna Indogram",
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 17),
        ),
        footer: ElevatedButton(
          onPressed: () => Navigator.pushReplacementNamed(context, "/auth/login"),
          child: const Text("Let's Go!"),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        image: SvgPicture.asset(
          "assets/images/vector/chat1.svg",
          height: _size.height * 0.2,
          width: _size.width * 0.6,
        ),
      ),
    ];
    return IntroductionScreen(
      scrollPhysics: const NeverScrollableScrollPhysics(),
      dotsDecorator: DotsDecorator(
        color: Colors.white,
        activeColor: Core.primary,
        size: const Size(10, 10),
        activeSize: const Size(20, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      pages: pageView,
      showSkipButton: true,
      skip: const Text(
        "Skip",
        style: TextStyle(fontSize: 16),
      ),
      next: const Text(
        "Next",
        style: TextStyle(fontSize: 16),
      ),
      done: const Text(
        "Done",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      onDone: () => Navigator.pushReplacementNamed(context, Routes.login),
      showDoneButton: true,
    );
  }
}
