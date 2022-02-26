import 'package:flutter/material.dart';

import '../../core/style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> socialIcon = [
      "assets/images/social_media/github.png",
      "assets/images/social_media/linkedin.png",
      "assets/images/social_media/medium.png",
    ];

    const String about =
        "Hallo semua nama saya Yoga. Saya seorang Flutter Software Engineer yang masih duduk dibangku kuliah. Aplikasi ini merupakan Big Project pertama kali saya dalam dunia Mobile Apps.";

    Size _size = MediaQuery.of(context).size;
    final padding = _size.width * 0.03;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("Profile"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit_rounded),
            )
          ],
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: padding,
                right: padding,
                top: padding,
              ),
              color: Core.component,
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          bottom: _size.height * 0.11,
                        ),
                        height: _size.height * 0.25,
                        width: _size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/sampul.jpg"),
                            fit: BoxFit.cover,
                          ),
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
                              backgroundImage:
                                  const AssetImage("assets/images/pp.jpg"),
                              radius: _size.height * 0.095,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Text(
                        "Super Man",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Flutter Software Engineer",
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Edit Profile",
                          style: TextStyle(fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(_size.width * 0.5, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: socialIcon.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisExtent: _size.width * 0.15,
                            mainAxisSpacing: 20),
                        itemBuilder: (context, i) => Image.asset(socialIcon[i]),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          userData("Project", "3"),
                          userData("Following", "202"),
                          userData("Followers", "3003"),
                        ],
                      ),
                      const Divider(
                        color: Colors.white,
                        height: 20,
                        thickness: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Core.component,
              padding: const EdgeInsets.only(bottom: 15),
              child: Container(
                margin: EdgeInsets.only(
                  left: padding,
                  right: padding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "About",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      about,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              width: _size.width,
              color: Core.component,
              child: Container(
                margin: EdgeInsets.only(right: padding, left: padding, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Post",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      decoration: InputDecoration(
                        fillColor: Core.primaryX,
                        filled: true,
                        counter: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text("Send"),
                        ),
                        icon: CircleAvatar(
                          backgroundImage:
                              const AssetImage("assets/images/pp.jpg"),
                          radius: _size.height * 0.03,
                        ),
                        hintText: "Post your new status",
                        hintStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox socialMedia(Size _size, String image) {
    return SizedBox(
      height: _size.width * 0.15,
      child: Image.asset(image),
    );
  }

  Column userData(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
