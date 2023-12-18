import 'package:flutter/material.dart';
import 'package:my_market/providers/product_provider.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    getInit();
    super.initState();
  }

  getInit() async {
    try {
      await Provider.of<ProductProvider>(context, listen: false).getProducts();

      Future.delayed(Duration.zero, () {
        Navigator.pushReplacementNamed(context, '/sign-in');
      });
    } catch (error) {
      print('Error fetching products: $error');
    } finally {
      print('get init selesai di jalankan');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 226, 226),
      body: Center(
        child: Container(
          width: 130,
          height: 150,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/Black and White Collection 3.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
