import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrihome/controller/auth_provider.dart';
import 'package:nutrihome/controller/firestore_provider.dart';

import 'package:nutrihome/helpers/colors.dart';
import 'package:nutrihome/views/client/profile/personal_details_edit_screen.dart';

import 'package:nutrihome/views/widgets/custom_back_button.dart';
import 'package:provider/provider.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<FirestoreProvider>(context, listen: false).fetchCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: SafeArea(
        child: SingleChildScrollView(
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
              SizedBox(
                height: size.height * 0.02,
              ),
              Center(
                child: Consumer<FirestoreProvider>(
                  builder: (context, value, child) => Container(
                    width: size.width * 0.3,
                    height: size.height * 0.15,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: value.currentUser!.image != null
                                ? NetworkImage(value.currentUser!.image!)
                                : const AssetImage("assets/icons/profile.png")
                                    as ImageProvider,
                            fit: BoxFit.cover),
                        color: productbgcolor,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 20, 0),
                child: Consumer<FirestoreProvider>(
                  builder: (context, pro, child) => Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Name :',
                              style: GoogleFonts.urbanist(
                                  fontSize: 22,
                                  color: componentcolor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: size.width * 0.1),
                            Text(
                              pro.currentUser!.username!,
                              style: GoogleFonts.urbanist(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Phone :',
                              style: GoogleFonts.urbanist(
                                  fontSize: 22,
                                  color: componentcolor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: size.width * 0.1),
                            Text(
                              pro.currentUser!.phonenumber ?? " not available",
                              style: GoogleFonts.urbanist(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Email :',
                              style: GoogleFonts.urbanist(
                                  fontSize: 22,
                                  color: componentcolor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: size.width * 0.1),
                            Expanded(
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                pro.currentUser!.email!,
                                style: GoogleFonts.urbanist(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              width: size.width * 0.3,
                              height: size.height * 0.05,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            componentcolor),
                                    shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)))),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PersonalDetailsEditScreen(
                                          currentuser: pro.currentUser!,
                                        ),
                                      ));
                                },
                                child: const Text(
                                  'Edit',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                          SizedBox(
                              width: size.width * 0.3,
                              height: size.height * 0.05,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            componentcolor),
                                    shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)))),
                                onPressed: () {
                                  Provider.of<AuthProvider>(context,
                                          listen: false)
                                      .signOut();
                                },
                                child: const Text(
                                  'Log out',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
