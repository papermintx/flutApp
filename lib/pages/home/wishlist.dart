import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_market/providers/navbar_provider.dart';
import 'package:my_market/providers/wishlist_provider.dart';
import 'package:my_market/widgets/wishlist_card.dart';
import 'package:provider/provider.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    Widget header() {
      return AppBar(
        backgroundColor: const Color.fromARGB(255, 231, 226, 226),
        centerTitle: true,
        title: Text(
          'Barang Favorit',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyWishlist() {
      return Expanded(
        child: Center(
          child: Container(
            width: double.infinity,
            color: const Color.fromARGB(255, 231, 226, 226),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/image_wishlist.png',
                  width: 74,
                ),
                const SizedBox(
                  height: 23,
                ),
                Text(
                  ' Kamu belum memiliki barang impian?',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text('Ayo temukan Perabotan favoritmu',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                    )),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 44,
                  child: TextButton(
                    onPressed: () {
                      Provider.of<BottomNavbarProvider>(context, listen: false)
                          .changeIndex(0);
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/home',
                        (route) => false,
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 24,
                      ),
                      backgroundColor: Colors.blue[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Jelajahi Toko',
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
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          color: const Color.fromARGB(255, 231, 226, 226),
          child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              children: wishlistProvider.wishlist
                  .map((product) => WishlistCard(
                        product: product,
                      ))
                  .toList()),
        ),
      );
    }

    return Column(
      children: [
        header(),
        wishlistProvider.wishlist.isEmpty ? emptyWishlist() : content(),
      ],
    );
  }
}
