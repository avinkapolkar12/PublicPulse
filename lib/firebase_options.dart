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
    apiKey: 'AIzaSyBCssG4GtvmOP2XQa22RRgUXyK_k8tZE-s',
    appId: '1:431418133912:web:a54df9b5f34067748bafed',
    messagingSenderId: '431418133912',
    projectId: 'publicpulse2-fa778',
    authDomain: 'publicpulse2-fa778.firebaseapp.com',
    storageBucket: 'publicpulse2-fa778.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBSiKH7xDH_htH9ktRzgz759QxP4gdDWew',
    appId: '1:431418133912:android:cbf60b17ed11f2bd8bafed',
    messagingSenderId: '431418133912',
    projectId: 'publicpulse2-fa778',
    storageBucket: 'publicpulse2-fa778.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBAhFujmv1gIxviHJJQL4Vj_kZJFgkkAOg',
    appId: '1:431418133912:ios:c28939dd244509678bafed',
    messagingSenderId: '431418133912',
    projectId: 'publicpulse2-fa778',
    storageBucket: 'publicpulse2-fa778.appspot.com',
    iosBundleId: 'com.example.publicpulse2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBAhFujmv1gIxviHJJQL4Vj_kZJFgkkAOg',
    appId: '1:431418133912:ios:c28939dd244509678bafed',
    messagingSenderId: '431418133912',
    projectId: 'publicpulse2-fa778',
    storageBucket: 'publicpulse2-fa778.appspot.com',
    iosBundleId: 'com.example.publicpulse2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBCssG4GtvmOP2XQa22RRgUXyK_k8tZE-s',
    appId: '1:431418133912:web:51a0618660816dc48bafed',
    messagingSenderId: '431418133912',
    projectId: 'publicpulse2-fa778',
    authDomain: 'publicpulse2-fa778.firebaseapp.com',
    storageBucket: 'publicpulse2-fa778.appspot.com',
  );

}