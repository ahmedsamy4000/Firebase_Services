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
    apiKey: 'AIzaSyCMqiW-QOePoDF09lTJ8BwJ2LK3XGhodUU',
    appId: '1:909839242278:web:de5a88f4a193368b5942e7',
    messagingSenderId: '909839242278',
    projectId: 'iti-flutter-app',
    authDomain: 'iti-flutter-app.firebaseapp.com',
    storageBucket: 'iti-flutter-app.appspot.com',
    measurementId: 'G-HJYR47TXBS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDuWycJT_T3rCi0ixUda1yV44KN5k3gkds',
    appId: '1:909839242278:android:a6f071ad95da57365942e7',
    messagingSenderId: '909839242278',
    projectId: 'iti-flutter-app',
    storageBucket: 'iti-flutter-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyABctKDktPEdy8hn3SstA7xTKcbvn-Dqps',
    appId: '1:909839242278:ios:20e8aebff7f743ae5942e7',
    messagingSenderId: '909839242278',
    projectId: 'iti-flutter-app',
    storageBucket: 'iti-flutter-app.appspot.com',
    iosBundleId: 'com.example.firebaseApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyABctKDktPEdy8hn3SstA7xTKcbvn-Dqps',
    appId: '1:909839242278:ios:20e8aebff7f743ae5942e7',
    messagingSenderId: '909839242278',
    projectId: 'iti-flutter-app',
    storageBucket: 'iti-flutter-app.appspot.com',
    iosBundleId: 'com.example.firebaseApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCMqiW-QOePoDF09lTJ8BwJ2LK3XGhodUU',
    appId: '1:909839242278:web:a622f888baea3b575942e7',
    messagingSenderId: '909839242278',
    projectId: 'iti-flutter-app',
    authDomain: 'iti-flutter-app.firebaseapp.com',
    storageBucket: 'iti-flutter-app.appspot.com',
    measurementId: 'G-GW6CT7E6VZ',
  );
}
