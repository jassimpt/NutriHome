class ProductsModel {
  String? name;
  int? price;
  String? weight;
  double? totalservings;
  String? flavour;
  String? serving;
  String? howtouse;
  String? imageurl;
  String? category;

  ProductsModel(
      {required this.category,
      required this.flavour,
      required this.howtouse,
      required this.imageurl,
      required this.name,
      required this.price,
      required this.serving,
      required this.totalservings,
      required this.weight});

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
        category: json["category"],
        flavour: json["flavour"],
        howtouse: json["howtouse"],
        imageurl: json["imageurl"],
        name: json["name"],
        price: json["price"],
        serving: json["serving"],
        totalservings: json["totalservings"],
        weight: json["weight"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "category": category,
      "flavour": flavour,
      "howtouse": howtouse,
      "imageurl": imageurl,
      "price": price,
      "serving": serving,
      "totalservings": totalservings,
      "weight": weight
    };
  }
}
