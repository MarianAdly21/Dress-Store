// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBE8S51m9nOxFs84FlQfFfqgmKBzBtzloo',
    appId: '1:290932343834:web:eb88dc72be847a73b87da3',
    messagingSenderId: '290932343834',
    projectId: 'dress-store-app',
    authDomain: 'dress-store-app.firebaseapp.com',
    storageBucket: 'dress-store-app.firebasestorage.app',
    measurementId: 'G-TH32LZ1ETL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBEwB9VHgMq6SrYbwVbkK0tzi1rm8IPQxE',
    appId: '1:290932343834:android:73e1b2b371e0dc1eb87da3',
    messagingSenderId: '290932343834',
    projectId: 'dress-store-app',
    storageBucket: 'dress-store-app.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBv2OWQbYivRuK50EgYj2NgkRAzhXtzKdA',
    appId: '1:290932343834:ios:72f5f3c064667ab4b87da3',
    messagingSenderId: '290932343834',
    projectId: 'dress-store-app',
    storageBucket: 'dress-store-app.firebasestorage.app',
    iosBundleId: 'com.example.dressStore',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBv2OWQbYivRuK50EgYj2NgkRAzhXtzKdA',
    appId: '1:290932343834:ios:72f5f3c064667ab4b87da3',
    messagingSenderId: '290932343834',
    projectId: 'dress-store-app',
    storageBucket: 'dress-store-app.firebasestorage.app',
    iosBundleId: 'com.example.dressStore',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBE8S51m9nOxFs84FlQfFfqgmKBzBtzloo',
    appId: '1:290932343834:web:e951f49133a8056db87da3',
    messagingSenderId: '290932343834',
    projectId: 'dress-store-app',
    authDomain: 'dress-store-app.firebaseapp.com',
    storageBucket: 'dress-store-app.firebasestorage.app',
    measurementId: 'G-ETWXPHNDWT',
  );
}
