
import 'package:my_market/models/category_model.dart';
import 'package:my_market/models/product_model.dart';

class MessageModel {
  String? message;
  int? userId;
  String? userName;
  String? userImage;
  bool? isFromUser;
  ProductModel? product;
  DateTime? createdAt;
  DateTime? updatedAt;

  MessageModel({
    this.message,
    this.userId,
    this.userName,
    this.userImage,
    this.isFromUser,
    this.product,
    this.createdAt,
    this.updatedAt,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userId = json['userId'];
    userName = json['userName'];
    userImage = json['userImage'];
    isFromUser = json['isFromUser'];
    if (json['product'] != null && json['product'] is Map<String, dynamic>) {
      product = ProductModel.fromJson(json['product']);
    } else {
      product = UninitializedProductModel(
        id: 0,
        name: '',
        price: 0,
        description: '',
        tags: '',
        category: CategoryModel(id: 0, name: ''),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        galleries: [],
      );
    }
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'userId': userId,
      'userName': userName,
      'userImage': userImage,
      'isFromUser': isFromUser,
      'product': product is UninitializedProductModel ? {} : product!.toJson(),
      'createdAt': createdAt?.toString(),
      'updatedAt': updatedAt?.toString(),
    };
  }
}
