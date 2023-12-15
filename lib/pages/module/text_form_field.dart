import 'package:flutter/material.dart';
import 'package:my_market/theme.dart';

class HandleField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final dynamic prefixIcon;
  final double margintop;
  final bool secureText;

  const HandleField({
    Key? key,
    required this.label,
    required this.margintop,
    required this.hintText,
    required this.controller,
    required this.prefixIcon,
    required this.secureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: margintop),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: backgroundColor2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: TextFormField(
                obscureText: secureText,
                style: primaryTextStyle,
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: subtitleTextStyle,
                  prefixIcon: prefixIcon,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
