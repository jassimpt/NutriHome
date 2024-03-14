import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:nutrihome/controller/firestore_provider.dart';
import 'package:nutrihome/controller/image_provider.dart';
import 'package:nutrihome/helpers/colors.dart';
import 'package:nutrihome/model/user_model.dart';
import 'package:nutrihome/views/client/profile/widgets/addressfield.dart';
import 'package:nutrihome/views/widgets/custom_back_button.dart';
import 'package:provider/provider.dart';

class PersonalDetailsEditScreen extends StatefulWidget {
  const PersonalDetailsEditScreen({super.key, required this.currentuser});

  final UserModel currentuser;

  @override
  State<PersonalDetailsEditScreen> createState() =>
      _PersonalDetailsEditScreenState();
}

class _PersonalDetailsEditScreenState extends State<PersonalDetailsEditScreen> {
  TextEditingController namecontroller = TextEditingController();

  TextEditingController emailcontroller = TextEditingController();

  TextEditingController phonecontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    namecontroller.text = widget.currentuser.username!;
    emailcontroller.text = widget.currentuser.email!;
    phonecontroller.text = widget.currentuser.phonenumber ?? "";
  }

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
                ],
              ),
              Consumer<ImageController>(
                builder: (context, imagepro, child) => Center(
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          imagepro.selectImage(source: ImageSource.gallery);
                        },
                        child: Container(
                          width: size.width * 0.3,
                          height: size.height * 0.14,
                          decoration: BoxDecoration(
                            color: productbgcolor,
                            borderRadius: BorderRadius.circular(10),
                            image: imagepro.selectedimage != null
                                ? DecorationImage(
                                    image: FileImage(
                                      File(imagepro.selectedimage!.path),
                                    ),
                                    fit: BoxFit.cover)
                                : null,
                          ),
                          child: imagepro.selectedimage == null
                              ? LottieBuilder.asset(
                                  "assets/lottie/Animation - 1709788498330.json",
                                )
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),
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
                    AddressFields(
                      controller: phonecontroller,
                      text: "Phone Number",
                      width: size.width,
                      maxlines: 1,
                    ),
                    AddressFields(
                      controller: emailcontroller,
                      maxlines: 1,
                      text: "Email",
                      width: size.width,
                    ),
                    SizedBox(
                      height: size.height * 0.07,
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
                          updateUserInfo();
                        },
                        child: Text(
                          "Save profile",
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

  void updateUserInfo() async {
    final pro = Provider.of<FirestoreProvider>(context, listen: false);
    final imagepro = Provider.of<ImageController>(context, listen: false);
    await pro.addUserImage(
        username: namecontroller.text,
        fileimage: File(imagepro.selectedimage!.path));

    pro.updateUserInfo(
        email: emailcontroller.text,
        username: namecontroller.text,
        image: pro.service.downloadurl!,
        phonenumber: phonecontroller.text);
  }
}
