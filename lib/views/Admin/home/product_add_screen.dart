import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrihome/controller/firestore_provider.dart';
import 'package:nutrihome/helpers/colors.dart';
import 'package:nutrihome/model/products_model.dart';
import 'package:nutrihome/views/client/profile/widgets/addressfield.dart';
import 'package:nutrihome/views/widgets/custom_back_button.dart';
import 'package:provider/provider.dart';

class ProductAddScreen extends StatelessWidget {
  ProductAddScreen({super.key});

  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController pricecontroller = TextEditingController();
  final TextEditingController weightcontroller = TextEditingController();
  final TextEditingController totalservingscontroller = TextEditingController();
  final TextEditingController servingscontroller = TextEditingController();
  final TextEditingController imagecontroller = TextEditingController();
  final TextEditingController flavourcontroller = TextEditingController();
  final TextEditingController categorycontroller = TextEditingController();
  final TextEditingController howtousecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CustomBackButton(
                    bottom: 20,
                    left: 30,
                    right: 30,
                    top: 10,
                    size: size,
                    color: extrabgcolor,
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.1,
                  ),
                  Text(
                    'Add Product',
                    style: GoogleFonts.urbanist(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: fontcolor),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  children: [
                    AddressFields(
                      controller: namecontroller,
                      text: "Name",
                      width: size.width,
                      maxlines: 1,
                    ),
                    Row(
                      children: [
                        AddressFields(
                          controller: pricecontroller,
                          maxlines: 1,
                          text: "Price",
                          width: size.width * 0.43,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        AddressFields(
                          controller: weightcontroller,
                          maxlines: 1,
                          text: "Weight",
                          width: size.width * 0.43,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        AddressFields(
                          controller: totalservingscontroller,
                          maxlines: 1,
                          text: "Total servings",
                          width: size.width * 0.43,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        AddressFields(
                          controller: servingscontroller,
                          maxlines: 1,
                          text: "serving size",
                          width: size.width * 0.43,
                        ),
                      ],
                    ),
                    AddressFields(
                        controller: imagecontroller,
                        text: "Image url",
                        width: size.width,
                        maxlines: 1),
                    AddressFields(
                      maxlines: 1,
                      controller: flavourcontroller,
                      text: "Flavour",
                      width: size.width,
                    ),
                    AddressFields(
                      controller: categorycontroller,
                      maxlines: 1,
                      text: "Category",
                      width: size.width,
                    ),
                    AddressFields(
                      controller: howtousecontroller,
                      maxlines: 5,
                      text: "How to use",
                      width: size.width,
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    SizedBox(
                      height: size.height * 0.06,
                      width: size.width,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            backgroundColor:
                                const MaterialStatePropertyAll(componentcolor)),
                        onPressed: () {
                          addProduct(context);
                        },
                        child: Text(
                          "Add Product",
                          style: GoogleFonts.urbanist(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: fontcolor),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  addProduct(BuildContext context) {
    final pro = Provider.of<FirestoreProvider>(context, listen: false);
    ProductsModel product = ProductsModel(
        category: categorycontroller.text,
        flavour: flavourcontroller.text,
        howtouse: howtousecontroller.text,
        imageurl: imagecontroller.text,
        name: namecontroller.text,
        price: int.parse(pricecontroller.text),
        serving: servingscontroller.text,
        totalservings: double.parse(totalservingscontroller.text),
        weight: weightcontroller.text);
    pro.addProduct(product: product, category: categorycontroller.text);
    Navigator.pop(context);
  }
}
