import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_market/models/user_model.dart';
import 'package:my_market/providers/auth_provider.dart';
import 'package:my_market/providers/product_provider.dart';
import 'package:my_market/widgets/product_card.dart';
import 'package:my_market/widgets/product_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: 30,
          right: 30,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hallo, ${user.name}',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '@${user.username}',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 54,
                  height: 54,
                  child: ClipOval(
                    child: Icon(
                      Icons.person,
                      size: 54,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
              height: 20,
            ),
          ],
        ),
      );
    }

    Widget kategori() {
      return Container(
        margin: EdgeInsets.only(
          top: 30.0,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: 30.0,
              ),
              ListKategoriAktif(label: 'Semua Produk'),
              ListKategoriOf(label: 'Alat Masak'),
              ListKategoriOf(label: 'Alat Mandi'),
              ListKategoriOf(label: 'Pekakas'),
              ListKategoriOf(label: 'Alat Makan'),
              SizedBox(
                width: 30,
              ),
            ],
          ),
        ),
      );
    }

    Widget judulProdukPopuler() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: 30,
          right: 30,
        ),
        child: Text(
          'Produk Populer',
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    Widget produkPopuler() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(
              width: 30.0,
            ),
            Row(
              children: productProvider.products
                  .map(
                    (product) => ProductCard(
                      product: product,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      );
    }

    Widget judulProdukBaru() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: 30,
          right: 30,
        ),
        child: Text(
          'Produk Baru',
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    Widget produkBaru() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: Column(
          children: productProvider.products
              .map((product) => ProductTile(product: product))
              .toList(),
        ),
      );
    }

    return ListView(
      children: [
        header(),
        kategori(),
        judulProdukPopuler(),
        produkPopuler(),
        judulProdukBaru(),
        produkBaru(),
      ],
    );
  }
}

class ListKategoriOf extends StatelessWidget {
  const ListKategoriOf({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Color(0xff504F5E),
        ),
        color: Colors.white,
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class ListKategoriAktif extends StatelessWidget {
  const ListKategoriAktif({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.blue[800],
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
