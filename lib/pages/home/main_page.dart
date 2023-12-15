import 'package:flutter/material.dart';
import 'package:my_market/pages/home/chat_page.dart';
import 'package:my_market/pages/home/home_page.dart';
import 'package:my_market/pages/home/profile.dart';
import 'package:my_market/pages/home/wishlist.dart';
import 'package:my_market/theme.dart';
import 'package:ionicons/ionicons.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  Widget cartButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        backgroundColor: secondaryColor,
        shape: CircleBorder(),
        child: const Icon(Ionicons.bag_outline),
      ),
    );
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const ChatPage();
      case 2:
        return const Wishlist();
      case 3:
        return const Profile();
      default:
        return const Text('error');
    }
  }

  Widget customBottom() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
      child: BottomAppBar(
        height: 80,
        notchMargin: 5,
        clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildNavBarItem(0, Ionicons.home),
            buildNavBarItem(1, Ionicons.chatbox),
            const SizedBox(width: 48),
            buildNavBarItem(2, Ionicons.heart),
            buildNavBarItem(3, Ionicons.person_circle),
          ],
        ),
      ),
    );
  }

  Widget buildNavBarItem(int index, IconData icon) {
    return InkWell(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: currentIndex == index ? primaryColor : Colors.grey,
            ),
            SizedBox(height: 4),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentIndex == 0 ? Colors.grey[900] : backgroundColor3,
      body: body(),
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottom(),
    );
  }
}
