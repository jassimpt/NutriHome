import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nutrihome/model/address_model.dart';
import 'package:nutrihome/model/cart_item_model.dart';
import 'package:nutrihome/model/products_model.dart';
import 'package:nutrihome/model/user_model.dart';
import 'package:nutrihome/service/firestore_service.dart';

class FirestoreProvider extends ChangeNotifier {
  FirestoreService service = FirestoreService();
  List<ProductsModel> prodcuctslist = [];
  List<CartItemModel> cartlist = [];
  List<ProductsModel> wishlist = [];
  List<ProductsModel> searchedproducts = [];
  List<AddressModel> addresslist = [];
  List<String> categorieslist = [];
  String? selectedCategory;
  UserModel? currentUser;
  String searchQuery = "";
  int quantity = 1;
  String? downloadurl;

  fetchCurrentUser() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await service.firestore
          .collection("users")
          .doc(service.auth.currentUser!.uid)
          .get();
      currentUser = UserModel.fromJson(snapshot.data()!);
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  addProduct({required ProductsModel product, required String name}) {
    return service.addProductAdmin(product, name);
  }

  fetchAllCategories() {
    try {
      service.firestore.collection("products").snapshots().listen((product) {
        categorieslist = product.docs
            .map((doc) => ProductsModel.fromJson(doc.data()).category!)
            .toSet()
            .toList();
        notifyListeners();
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  List<ProductsModel> fetchProductsByCategory({required String category}) {
    try {
      prodcuctslist.clear();
      service.firestore
          .collection('products')
          .where("category", isEqualTo: category)
          .snapshots()
          .listen((product) {
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

  List<ProductsModel> fetchProducts() {
    if (searchQuery.isNotEmpty) {
      // Fetch searched products
      service.firestore.collection('products').snapshots().listen((product) {
        prodcuctslist = product.docs
            .map((doc) => ProductsModel.fromJson(doc.data()))
            .where((ProductsModel product) =>
                product.name!.toLowerCase().contains(searchQuery.toLowerCase()))
            .toList();
        notifyListeners();
      });
      return prodcuctslist;
    } else {
      // Fetch all products
      service.firestore.collection('products').snapshots().listen((product) {
        prodcuctslist = product.docs
            .map((doc) => ProductsModel.fromJson(doc.data()))
            .toList();
        notifyListeners();
      });
      return prodcuctslist;
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
      return wishlist;
    } catch (e) {
      throw Exception(e);
    }
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

  deleteWishlistItem({required String productname}) {
    return service.deleteWishlistItem(productname);
  }

  deleteCartItem({required String productname}) {
    return service.deleteCartItem(productname);
  }

  searchProducts(String query) {
    searchQuery = query;
    fetchProducts();
  }

  addUserImage({required String username, required fileimage}) async {
    return service.addUserImage(username: username, fileimage: fileimage);
  }

  updateUserInfo(
      {required String email,
      required String username,
      required String image,
      required String phonenumber}) {
    return service.updateUserInfo(
        email: email,
        username: username,
        image: image,
        phonenumber: phonenumber);
  }

  saveUserAddress({required String landmark, required AddressModel address}) {
    return service.saveUserAddress(landmark: landmark, address: address);
  }

  fetchUserAddress() {
    try {
      service.firestore
          .collection('users')
          .doc(service.auth.currentUser!.uid)
          .collection("address")
          .snapshots()
          .listen((address) {
        addresslist = address.docs
            .map((doc) => AddressModel.fromJson(doc.data()))
            .toList();
        notifyListeners();
      });
      return addresslist;
    } catch (e) {
      throw Exception(e);
    }
  }

  deleteUserAddress({required String landmark}) {
    return service.deleteUserAddress(landmark: landmark);
  }

  updateUserAddress({required String landmark, required AddressModel address}) {
    return service.updateUserAddress(landmark: landmark, address: address);
  }
}
