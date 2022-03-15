import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/routes/routes.dart';

import 'calls.dart';
import 'chats.dart';
import 'groups.dart';
import 'models/popup_item.dart';
import 'widgets/alert.dart';
import '../../components/custom_glow.dart';
import '../../core/style.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {

  late TabController controller;
  final tabScales = List.generate(3, (index) => index == 0 ? 1.0 : 0.0);
  late TextEditingController _searchController;
  bool _isSearch = false;

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this, initialIndex: 0);
    controller.animation!.addListener(() {
      setState(() {
        final animationValue = controller.animation!.value;
        final currentTabIndex = animationValue.round();
        final currentOffset = currentTabIndex - animationValue;
        for (int i = 0; i < 3; i++) {
          if (i == currentTabIndex) {
            tabScales[i] = (0.5 - currentOffset.abs()) / 0.5;
          } else {
            tabScales[i] = 0.0;
          }
        }
      });
    });
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(() {
      setState(() {});
    });
    controller.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as UserCredential;
    inspect(args.user!.email);
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: ScrollConfiguration(
          behavior: NoGlow(),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                snap: true,
                pinned: true,
                backgroundColor: Core.component,
                title: _isSearch
                    ? TextField(
                        controller: _searchController,
                        autofocus: true,
                      )
                    : const Text(
                        "Indogram",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                centerTitle: true,
                leading: _isSearch
                    ? const Icon(Icons.search_rounded)
                    : GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, "/user/profile"),
                        child: Hero(
                          tag: "profile",
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Container(
                              margin: const EdgeInsets.all(1),
                              child: CircleAvatar(
                                child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl:
                                        "https://firebasestorage.googleapis.com/v0/b/indogram-fef3e.appspot.com/o/photo_profile%2Fprofile.png?alt=media&token=6af87aa0-30b7-4d0d-b708-817469b5de57"),
                              ),
                            ),
                          ),
                        ),
                      ),
                actions: [
                  IconButton(
                    icon: _isSearch
                        ? const Icon(Icons.clear_rounded)
                        : const Icon(Icons.search_rounded),
                    onPressed: () => setState(() {
                      _isSearch = !_isSearch;
                    }),
                  ),
                  PopupMenuButton<MenuItem>(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    onSelected: (value) => onSelected(context, value),
                    itemBuilder: (context) => <PopupMenuItem<MenuItem>>[
                      buildItem(MenuItems.settings),
                      buildItem(MenuItems.signOut),
                    ],
                  )
                ],
                bottom: TabBar(
                  labelColor: Core.primary,
                  unselectedLabelColor: Colors.white70,
                  controller: controller,
                  indicatorColor: Core.primary,
                  tabs: <Tab>[
                    tab(Icons.message_rounded, "Chats"),
                    tab(Icons.group_rounded, "Groups"),
                    tab(Icons.call_rounded, "Calls"),
                  ],
                ),
              ),
              SliverFillRemaining(
                child: TabBarView(
                  controller: controller,
                  children: const <Widget>[
                    Chats(),
                    Groups(),
                    Calls(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: createScaledFab(),
    );
  }

  Transform createScaledFab() {
    final indexOfCurrentFab = tabScales.indexWhere((fabScale) => fabScale != 0);
    final fab = createFab(indexOfCurrentFab);
    final currentFabScale = tabScales[indexOfCurrentFab];
    return Transform.scale(scale: currentFabScale, child: fab);
  }

  FloatingActionButton createFab(final int index) {
    switch (index) {
      case 0:
        return FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.border_color_rounded),
        );
      case 1:
        return FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.group_add),
        );
      case 2:
        return FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add_ic_call_rounded),
        );
      default:
        return FloatingActionButton(
          onPressed: () {},
        );
    }
  }

  Tab tab(IconData icon, String label) => Tab(
        icon: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(
              width: 5,
            ),
            Text(label)
          ],
        ),
      );

  PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem(
        child: Row(
          children: [
            Icon(
              item.icon,
              color: Colors.black,
            ),
            const SizedBox(width: 10),
            Text(
              item.name,
              style: const TextStyle(color: Colors.black),
            )
          ],
        ),
        value: item,
      );

  void onSelected(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.settings:
        Navigator.pushNamed(context, Routes.setting);
        break;
      case MenuItems.signOut:
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => const Alert());
        break;
    }
  }
}
