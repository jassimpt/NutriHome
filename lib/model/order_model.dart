import 'package:nutrihome/model/address_model.dart';
import 'package:nutrihome/model/cart_item_model.dart';
import 'package:nutrihome/model/user_model.dart';

class OrderModel {
  UserModel? user;
  AddressModel? address;
  List<CartItemModel>? product;
  String? orderStatus;
  String? paymentStatus;
  String? totalAmount;
  String? paymentMethod;
  String? orderid;

  OrderModel(
      {required this.address,
      required this.orderStatus,
      required this.paymentMethod,
      required this.paymentStatus,
      required this.product,
      required this.totalAmount,
      required this.orderid,
      required this.user});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> productListJson = json['product'];
    List<CartItemModel> productList = productListJson
        .map((productJson) => CartItemModel.fromJson(productJson))
        .toList();
    return OrderModel(
        orderid: json["orderid"],
        address: AddressModel.fromJson(json["address"]),
        orderStatus: json["orderStatus"],
        paymentMethod: json["paymentMethod"],
        paymentStatus: json["paymentStatus"],
        product: productList,
        totalAmount: json["totalAmount"],
        user: UserModel.fromJson(json["user"]));
  }

  Map<String, dynamic> toJson() {
    return {
      "orderid": orderid,
      "address": address!.toJson(),
      "orderStatus": orderStatus,
      "paymentMethod": paymentMethod,
      'paymentStatus': paymentStatus,
      'product': product!.map((product) => product.toJson()).toList(),
      "totalAmount": totalAmount,
      "user": user!.toJson()
    };
  }
}
