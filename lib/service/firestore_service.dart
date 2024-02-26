import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nutrihome/model/cart_item_model.dart';
import 'package:nutrihome/model/products_model.dart';

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  addProductAdmin(ProductsModel product, String category) async {
    try {
      await firestore
          .collection("products")
          .doc(category)
          .set(product.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  addToCartClient(CartItemModel product, String productname) async {
    try {
      await firestore
          .collection("users")
          .doc(auth.currentUser!.uid)
          .collection("cart")
          .doc(productname)
          .set(product.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  addToWishlistClient(ProductsModel product, String productname) async {
    try {
      await firestore
          .collection("users")
          .doc(auth.currentUser!.uid)
          .collection('wishlist')
          .doc(productname)
          .set(product.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }
}
