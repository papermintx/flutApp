import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_market/models/cart_model.dart';
import 'package:my_market/theme.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({super.key, required this.cart});

  final CartModel cart;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.network(
              cart.product!.galleries![0].url!,
            ),
          ),
          SizedBox(
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
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 2,
                ),
                Text('\$${cart.product!.price}',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: medium,
                      color: Colors.blue,
                    )),
              ],
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            '${cart.quantity} Items',
            style: GoogleFonts.poppins(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
