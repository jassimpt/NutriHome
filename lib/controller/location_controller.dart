import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationController extends ChangeNotifier {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController countrycontroller = TextEditingController();
  final TextEditingController citycontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController landmarkcontroller = TextEditingController();
  final TextEditingController addresscontroller = TextEditingController();
  bool isloading = false;

  getCurrentLocationAndFillAddress() async {
    try {
      isloading = true;
      notifyListeners();
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          print('location permission denied');
          return null;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        print('Location Denied Forever');
        return null;
      }
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
          timeLimit: const Duration(seconds: 10));
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      countrycontroller.text = placemarks[0].country ?? "";
      citycontroller.text = placemarks[0].locality ?? "";
      addresscontroller.text = placemarks[0].street ?? "";
      landmarkcontroller.text = placemarks[0].name ?? "";
      notifyListeners();
    } catch (e) {
      throw Exception("Error GEtting User Location $e");
    } finally {
      isloading = false;
      notifyListeners();
    }
  }

  // clearFields() {
  //   namecontroller.clear();
  //   countrycontroller.clear();
  //   citycontroller.clear();
  //   addresscontroller.clear();
  //   landmarkcontroller.clear();
  //   phonecontroller.clear();
  // }
}
