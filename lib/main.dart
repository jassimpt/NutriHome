import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nutrihome/controller/auth_provider.dart';
import 'package:nutrihome/controller/firestore_provider.dart';
import 'package:nutrihome/controller/image_provider.dart';
import 'package:nutrihome/controller/location_controller.dart';
import 'package:nutrihome/firebase_options.dart';
import 'package:nutrihome/views/login/authgate.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FirestoreProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ImageController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LocationController(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthGate(),
      ),
    );
  }
}
