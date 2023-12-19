import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_market/models/product_model.dart';
import 'package:my_market/providers/cart_provider.dart';
import 'package:provider/provider.dart';

import '../providers/wishlist_provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.product});

  final ProductModel product;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List familiarShoes = [
    'assets/pngegg.png',
    'assets/pngegg (1).png',
    'assets/pngegg (2).png',
    'assets/pngegg (3).png',
    'assets/pngegg (4).png',
    'assets/pngegg (5).png',
    'assets/pngegg (6).png',
    'assets/pngegg (7).png',
    'assets/pngegg (8).png',
    'assets/pngegg (9).png',
    'assets/pngegg (10).png',
    'assets/pngegg (11).png',
    'assets/pngegg (12).png',
    'assets/pngegg (13).png',
    'assets/pngegg (14).png',
    'assets/pngegg (15).png',
    'assets/pngegg (16).png',
    'assets/pngegg (17).png',
    'assets/pngegg (18).png',
    'assets/pngegg (21).png',
    'assets/pngegg (22).png',
    'assets/pngegg (23).png',
    'assets/pngegg (24).png',
    'assets/pngegg (25).png',
    'assets/pngegg (26).png',
    'assets/pngegg (27).png',
    'assets/pngegg (28).png',
    'assets/pngegg (29).png',
  ];

  int currentIndex = 0;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    Future<void> showSuccessDialog(BuildContext context) async {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.of(context).pop(true);
          });

          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  const Icon(
                    Ionicons.checkmark_circle,
                    color: Colors.blue,
                    size: 100,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Item berhasil\nditambahkan',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: const Color(0xff999999),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 154,
                    height: 44,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/cart');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Lihat keranjang',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    Widget indicator(int index) {
      return Container(
        width: currentIndex == index ? 16 : 4,
        height: 4,
        margin: const EdgeInsets.symmetric(
          horizontal: 2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ? Colors.blue : Colors.grey,
        ),
      );
    }

    Widget lainnya(String imageUrl) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imageUrl,
        ),
      );
    }

    Widget header() {
      List<String>? galleries =
          widget.product.galleries?.map((image) => image.url!).toList();

      if (galleries == null || galleries.isEmpty || galleries.length == 1) {
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 20,
                bottom: 10,
                left: 30.0,
                right: 30.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.chevron_left,
                      color: Colors.black,
                      size: 34,
                    ),
                  ),
                  Text(
                    "Detail Produk",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                    child: const Icon(
                      Icons.shopping_bag,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            galleries != null && galleries.isNotEmpty
                ? Image.network(
                    galleries.first,
                    height: 250,
                  )
                : Container(),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      } else {
        int currentIndex = 0;

        return Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 20,
                bottom: 10,
                left: 30.0,
                right: 30.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.chevron_left,
                      color: Colors.black,
                      size: 34,
                    ),
                  ),
                  Text(
                    "Detail Produk",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                    child: const Icon(
                      Icons.shopping_bag,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            CarouselSlider(
              items: galleries.map((image) {
                return Image.network(
                  image,
                  height: 250,
                );
              }).toList(),
              options: CarouselOptions(
                autoPlay: true,
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: galleries.map((e) {
                return indicator(currentIndex);
              }).toList(),
            ),
          ],
        );
      }
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 17, left: 15, right: 15),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(8),
            bottom: Radius.circular(8),
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 10,
                bottom: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.name.toString(),
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '${widget.product.category!.name}',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      wishlistProvider.setProduct(widget.product);

                      if (wishlistProvider.isWishlist(widget.product)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Ditambahkan ke Daftar Keinginan',
                              textAlign: TextAlign.center,
                            ),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );

                        Timer(const Duration(seconds: 2), () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Hapus dari Daftar Keinginan',
                              textAlign: TextAlign.center,
                            ),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );

                        // Timer to hide the Snackbar a   fter 1 second
                        Timer(const Duration(seconds: 1), () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        });
                      }
                    },
                    child: Icon(
                      wishlistProvider.isWishlist(widget.product)
                          ? Ionicons.star
                          : Ionicons.star_outline,
                      color: Colors.blue[800],
                      size: 25,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(
                top: 10,
              ),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Harga',
                    style: GoogleFonts.poppins(),
                  ),
                  Text(
                    'Rp.${widget.product.price}00',
                    style: GoogleFonts.poppins(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(
                top: 10.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deskripsi',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    '${widget.product.description}',
                    style: GoogleFonts.poppins(
                      color: const Color(0xff504F5E),
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16, top: 16, bottom: 10),
              width: double.infinity,
              margin: const EdgeInsets.only(
                top: 10.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    'Lainnya',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    items: familiarShoes.map((image) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            // margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: lainnya(image),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: familiarShoes.map((url) {
                      int index = familiarShoes.indexOf(url);
                      return Container(
                        width: _currentIndex == index ? 16 : 4,
                        height: 4.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: _currentIndex == index
                              ? Colors.blue
                              : const Color(0xffC4C4C4),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      );
    }

    Widget handdleCart() {
      return Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 231, 226, 226),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 26,
          horizontal: 30.0,
        ),
        // margin: EdgeInsets.all(30.0),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                const snackBar = SnackBar(
                  content: Text('Masih dalam tahap pengembangan'),
                  backgroundColor: Colors.blue,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.blue[800]),
                child: const Icon(
                  Icons.chat,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: SizedBox(
                height: 54,
                child: TextButton(
                  onPressed: () {
                    cartProvider.addCart(widget.product);
                    showSuccessDialog(context);
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.blue[800],
                  ),
                  child: Text(
                    'Masukkan ke keranjang',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 202, 200, 200),
        body: ListView(
          children: [
            header(),
            content(),
          ],
        ),
        bottomNavigationBar: handdleCart(),
      ),
    );
  }
}
