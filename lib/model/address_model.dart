class AddressModel {
  String? name;
  String? country;
  String? city;
  String? phonenumber;
  String? address;
  String? landmark;

  AddressModel(
      {required this.address,
      required this.city,
      required this.country,
      required this.landmark,
      required this.name,
      required this.phonenumber});

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
        address: json["address"],
        city: json["city"],
        country: json["country"],
        landmark: json["landmark"],
        name: json["name"],
        phonenumber: json["phonenumber"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "address": address,
      "city": city,
      "country": country,
      "landmark": landmark,
      "name": name,
      "phonenumber": phonenumber
    };
  }
}
