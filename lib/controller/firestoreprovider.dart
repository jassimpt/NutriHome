import 'package:flutter/material.dart';
import 'package:nutrihome/model/cartitemmodel.dart';
import 'package:nutrihome/model/productsmodel.dart';
import 'package:nutrihome/service/firestoreservice.dart';

class FirestoreProvider extends ChangeNotifier {
  FirestoreService service = FirestoreService();
  List<ProductsModel> prodcuctslist = [];
  List<CartItemModel> cartlist = [];
  List<ProductsModel> wishlist = [];
  int quantity = 1;
  addProduct({required ProductsModel product, required String category}) {
    return service.addProductAdmin(product, category);
  }

  List<ProductsModel> fetchAllProducts() {
    try {
      service.firestore.collection('products').snapshots().listen((product) {
        prodcuctslist = product.docs
            .map((doc) => ProductsModel.fromJson(doc.data()))
            .toList();
        notifyListeners();
      });
      return prodcuctslist;
    } catch (e) {
      throw Exception(e);
    }
  }

  addToCart({required CartItemModel product, required String productname}) {
    return service.addToCartClient(product, productname);
  }

  addToWishlist({required ProductsModel product, required String productname}) {
    return service.addToWishlistClient(product, productname);
  }

  List<CartItemModel> fetchCartItems() {
    try {
      service.firestore
          .collection("users")
          .doc(service.auth.currentUser!.uid)
          .collection("cart")
          .snapshots()
          .listen((cartitem) {
        cartlist = cartitem.docs
            .map((doc) => CartItemModel.fromJson(doc.data()))
            .toList();
        notifyListeners();
      });
      return cartlist;
    } catch (e) {
      throw Exception(e);
    }
  }

  List<ProductsModel> fetchWishListItems() {
    try {
      service.firestore
          .collection("users")
          .doc(service.auth.currentUser!.uid)
          .collection("wishlist")
          .snapshots()
          .listen((wishlistitem) {
        wishlist = wishlistitem.docs
            .map((doc) => ProductsModel.fromJson(doc.data()))
            .toList();
        notifyListeners();
      });
    } catch (e) {}
  }

  void incrementQuantity(CartItemModel product) {
    final int index = cartlist.indexOf(product);
    quantity = quantity + 1;
    cartlist[index].price! * quantity;
    notifyListeners();
    updateQuantityInFirestore(cartlist[index].name, product);
  }

  void decrementQuantity(CartItemModel product) {
    final int index = cartlist.indexOf(product);
    if (quantity > 1) {
      quantity = quantity - 1;
      cartlist[index].price! * quantity;

      notifyListeners();
      updateQuantityInFirestore(cartlist[index].name, product);
    }
  }

  updateQuantityInFirestore(productname, CartItemModel product) async {
    try {
      await service.firestore
          .collection("users")
          .doc(service.auth.currentUser!.uid)
          .collection("cart")
          .doc(productname)
          .update({"quantity": quantity});
    } catch (e) {
      throw Exception(e);
    }
  }
}
