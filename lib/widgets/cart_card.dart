import 'package:flutter/material.dart';
import 'package:my_market/theme.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key});
  // CartCard(this.cart);

  @override
  Widget build(BuildContext context) {
    // CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: backgroundColor4,
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
                  image: DecorationImage(
                      image: AssetImage('assets/image_shoes.png')),
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
                      'cart.product.name',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      '\${cart.product.price}',
                      style: priceTextStyle,
                    ),
                  ],
                ),
              ),
              Column(
              
                children: [
                  Image.asset(
                    'assets/button_add.png',
                    width: 16,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    '12',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Image.asset(
                    'assets/button_min.png',
                    width: 16,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Image.asset(
                'assets/icon_remove.png',
                width: 10,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                'Remove',
                style: alertTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: light,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}