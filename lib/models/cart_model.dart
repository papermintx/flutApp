import 'package:my_market/models/product_model.dart';

class CartModel {
  int? id;
  ProductModel? product;
  int? quantity;

  CartModel({
    this.id,
    this.product,
    this.quantity,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
        json['product'] != null ? ProductModel.fromJson(json['product']) : null;
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product
          ?.toJson(), // Memastikan product tidak null sebelum dipanggil toJson
      'quantity': quantity,
    };
  }

  double getTotalPrice() {
    if (product == null || quantity == null) {
      return 0;
    }
    return product!.price! * quantity!;
  }
}
