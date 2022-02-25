import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Profile"),
      ),
      body: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: _size.height * 0.25,
            width: _size.width,
            child: Image.asset(
              "assets/images/sampul.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: _size.height * 0.15,
            child: Hero(
              tag: "profile",
              child: CircleAvatar(
                radius: _size.height * 0.1,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  backgroundImage: const AssetImage("assets/images/pp.jpg"),
                  radius: _size.height * 0.095,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
