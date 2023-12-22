import 'package:my_market/pages/chart_page.dart';
import 'package:my_market/pages/checkout_page.dart';
import 'package:my_market/pages/checkout_success_page.dart';
import 'package:my_market/pages/edit_profile_page.dart';
import 'package:my_market/pages/home/main_page.dart';
import 'package:my_market/pages/sign_in_page.dart';
import 'package:my_market/pages/sign_up_page.dart';
import 'package:my_market/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:my_market/providers/auth_provider.dart';
import 'package:my_market/providers/cart_provider.dart';
import 'package:my_market/providers/navbar_provider.dart';
import 'package:my_market/providers/product_provider.dart';
import 'package:my_market/providers/transaction_provider.dart';
import 'package:my_market/providers/wishlist_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => WishlistProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => BottomNavbarProvider()),
        ChangeNotifierProvider(create: (context) => TransactionProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUp(),
          '/home': (context) => const MainPage(),
          '/cart': (context) => const CartPage(),
          '/checkout': (context) => const CheckoutPage(),
          '/checkout-success': (context) => const HalamanCheckoutBerhasil(),
          '/edit-profile': (context) => const HalamanEditProfil(),
        },
      ),
    );
  }
}
