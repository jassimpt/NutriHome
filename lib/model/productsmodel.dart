class ProductsModel {
  String? name;
  int? price;
  String? weight;
  double? totalservings;
  String? flavour;
  String? serving;
  String? howtouse;
  String? image;

  ProductsModel(
      {required this.flavour,
      required this.howtouse,
      required this.image,
      required this.name,
      required this.price,
      required this.serving,
      required this.totalservings,
      required this.weight});
}
