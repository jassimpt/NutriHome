import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:nutrihome/model/address_model.dart';
import 'package:nutrihome/model/cart_item_model.dart';
import 'package:nutrihome/model/products_model.dart';
import 'package:nutrihome/model/user_model.dart';

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Reference storage = FirebaseStorage.instance.ref();
  String? downloadurl;

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

  deleteWishlistItem(String productname) async {
    try {
      await firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection('wishlist')
          .doc(productname)
          .delete();
    } catch (e) {
      throw Exception(e);
    }
  }

  deleteCartItem(String productname) async {
    try {
      await firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection("cart")
          .doc(productname)
          .delete();
    } catch (e) {
      throw Exception(e);
    }
  }

  addUserImage({required String username, required fileimage}) async {
    Reference childfolder = storage.child('userimages');
    Reference image = childfolder.child("$username.jpg");
    try {
      await image.putFile(fileimage);
      downloadurl = await image.getDownloadURL();
    } catch (e) {
      throw Exception(e);
    }
  }

  updateUserInfo(
      {required String email,
      required String username,
      required String image,
      required String phonenumber}) async {
    try {
      UserModel user = UserModel(
        email: email,
        username: username,
        uid: auth.currentUser!.uid,
        image: image,
        phonenumber: phonenumber,
      );
      await firestore
          .collection("users")
          .doc(auth.currentUser!.uid)
          .update(user.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  saveUserAddress(
      {required String landmark, required AddressModel address}) async {
    try {
      await firestore
          .collection("users")
          .doc(auth.currentUser!.uid)
          .collection("address")
          .doc(landmark)
          .set(address.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  deleteUserAddress({required String landmark}) async {
    try {
      await firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection("address")
          .doc(landmark)
          .delete();
    } catch (e) {
      throw Exception(e);
    }
  }
}
