import 'package:flutter/material.dart';
import 'package:nutrihome/model/productsmodel.dart';
import 'package:nutrihome/service/firestoreservice.dart';

class FirestoreProvider extends ChangeNotifier {
  FirestoreService service = FirestoreService();
  List<ProductsModel> prodcuctslist = [];
  addProduct({required ProductsModel product, required String category}) {
    return service.addProduct(product, category);
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
}
