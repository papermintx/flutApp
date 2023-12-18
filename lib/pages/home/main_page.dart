import 'package:flutter/material.dart';
import 'package:my_market/pages/home/chat_page.dart';
import 'package:my_market/pages/home/home_page.dart';
import 'package:my_market/pages/home/profile.dart';
import 'package:my_market/pages/home/wishlist.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 231, 226, 226),
        body: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            HomePage(),
            ChatPage(),
            Wishlist(),
            Profile(),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  _pageController.jumpToPage(0); // Jump directly to page 0
                  _onPageChanged(0);
                },
                icon: Icon(Icons.home,
                    color: currentIndex == 0 ? Colors.blue : Colors.grey),
              ),
              IconButton(
                onPressed: () {
                  _pageController.jumpToPage(1); // Jump directly to page 1
                  _onPageChanged(1);
                },
                icon: Icon(Icons.chat,
                    color: currentIndex == 1 ? Colors.blue : Colors.grey),
              ),
              const SizedBox(width: 10), // Spacer
              FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cart');
                },
                backgroundColor: Colors.blue,
                mini: true,
                elevation: 0,
                child: const Icon(
                  Icons.shopping_bag,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10), // Spacer
              IconButton(
                onPressed: () {
                  _pageController.jumpToPage(2); // Jump directly to page 2
                  _onPageChanged(2);
                },
                icon: Icon(Icons.favorite,
                    color: currentIndex == 2 ? Colors.blue : Colors.grey),
              ),
              IconButton(
                onPressed: () {
                  _pageController.jumpToPage(3); // Jump directly to page 3
                  _onPageChanged(3);
                },
                icon: Icon(Icons.person,
                    color: currentIndex == 3 ? Colors.blue : Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
