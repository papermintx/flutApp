import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_market/models/cart_model.dart';
import 'package:my_market/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key, required this.cart});
  final CartModel cart;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Container(
      margin:const EdgeInsets.only(
        top: 30.0,
      ),
      padding:const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.network(
                  cart.product!.galleries![0].url!,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cart.product!.name!,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Rp.${cart.product?.price}00',
                      style: GoogleFonts.poppins(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      cartProvider.addQuantity(cart.id!);
                    },
                    child: const Icon(Ionicons.add_circle),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    cart.quantity.toString(),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () => cartProvider.reduceQuantity(cart.id!),
                    child: const Icon(Ionicons.remove_circle),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () => cartProvider.removeCart(cart.id!),
            child: Row(
              children: [
                const Icon(
                  Ionicons.trash_outline,
                  color: Colors.red,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  'Remove',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.red,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
