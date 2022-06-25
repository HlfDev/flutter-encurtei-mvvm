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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAXWUM85D5juVvmoYWBAJTdK5IhsKdDRF8',
    appId: '1:905494059295:web:7c84503d09721a8483782a',
    messagingSenderId: '905494059295',
    projectId: 'encurteily',
    authDomain: 'encurteily.firebaseapp.com',
    storageBucket: 'encurteily.appspot.com',
    measurementId: 'G-NK9H6TNNTC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBkchw_MT57m_I-yKorHNRgVH01AhjIoh0',
    appId: '1:905494059295:android:d3b9d2e34e135aa883782a',
    messagingSenderId: '905494059295',
    projectId: 'encurteily',
    storageBucket: 'encurteily.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDFa3JHFg_evYoNjV_smjg72Cv55Q-rde8',
    appId: '1:905494059295:ios:d005e2a9fbc16d1483782a',
    messagingSenderId: '905494059295',
    projectId: 'encurteily',
    storageBucket: 'encurteily.appspot.com',
    iosClientId: '905494059295-s0il1c6j1phtj4jk53stgo9t36t4u7jd.apps.googleusercontent.com',
    iosBundleId: 'com.example.encurteiLy',
  );
}
