import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nutrihome/model/productsmodel.dart';

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  addProduct(ProductsModel product, String category) async {
    try {
      await firestore
          .collection("products")
          .doc(category)
          .set(product.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }
}
