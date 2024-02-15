// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBRiB6n3armaXL056gJPmofyo62RTFtPK4',
    appId: '1:879624233055:web:d7ec89dff39a8f35863bea',
    messagingSenderId: '879624233055',
    projectId: 'nutrihome-aa612',
    authDomain: 'nutrihome-aa612.firebaseapp.com',
    storageBucket: 'nutrihome-aa612.appspot.com',
    measurementId: 'G-LHK4943Z27',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyApke8hR-Fpf3lbQB6HxK2IAiKSkPMJoX4',
    appId: '1:879624233055:android:2a4b5de37a459e0e863bea',
    messagingSenderId: '879624233055',
    projectId: 'nutrihome-aa612',
    storageBucket: 'nutrihome-aa612.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAEUJcW3WXYkPE4sxY8P2vaupD-jPUkrTQ',
    appId: '1:879624233055:ios:686a4228c51c0ed4863bea',
    messagingSenderId: '879624233055',
    projectId: 'nutrihome-aa612',
    storageBucket: 'nutrihome-aa612.appspot.com',
    iosBundleId: 'com.example.nutrihome',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAEUJcW3WXYkPE4sxY8P2vaupD-jPUkrTQ',
    appId: '1:879624233055:ios:fcb8efa33f5d9e0d863bea',
    messagingSenderId: '879624233055',
    projectId: 'nutrihome-aa612',
    storageBucket: 'nutrihome-aa612.appspot.com',
    iosBundleId: 'com.example.nutrihome.RunnerTests',
  );
}
