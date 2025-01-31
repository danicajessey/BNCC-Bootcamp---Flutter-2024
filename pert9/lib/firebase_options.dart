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
    apiKey: 'AIzaSyAPviFFSEE-B0r8K8Hg3nvOvxIdCZYcZ0U',
    appId: '1:522117241790:web:24b33b28120917d64f77ef',
    messagingSenderId: '522117241790',
    projectId: 'pertemuan9-55062',
    authDomain: 'pertemuan9-55062.firebaseapp.com',
    storageBucket: 'pertemuan9-55062.appspot.com',
    measurementId: 'G-RKVJHV55GG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDTBpU3PjPuT6LP2NHzBXFS1VaV_iA9SMI',
    appId: '1:522117241790:android:7e122af23418dd344f77ef',
    messagingSenderId: '522117241790',
    projectId: 'pertemuan9-55062',
    storageBucket: 'pertemuan9-55062.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCUBmj309QwzAUdBFBh6qfrLqcWLGo_-yA',
    appId: '1:522117241790:ios:a79d76488fb8ffd04f77ef',
    messagingSenderId: '522117241790',
    projectId: 'pertemuan9-55062',
    storageBucket: 'pertemuan9-55062.appspot.com',
    iosBundleId: 'com.example.pert9',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCUBmj309QwzAUdBFBh6qfrLqcWLGo_-yA',
    appId: '1:522117241790:ios:a79d76488fb8ffd04f77ef',
    messagingSenderId: '522117241790',
    projectId: 'pertemuan9-55062',
    storageBucket: 'pertemuan9-55062.appspot.com',
    iosBundleId: 'com.example.pert9',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAPviFFSEE-B0r8K8Hg3nvOvxIdCZYcZ0U',
    appId: '1:522117241790:web:6fb30ae93eb7baa54f77ef',
    messagingSenderId: '522117241790',
    projectId: 'pertemuan9-55062',
    authDomain: 'pertemuan9-55062.firebaseapp.com',
    storageBucket: 'pertemuan9-55062.appspot.com',
    measurementId: 'G-LVP2KSW03T',
  );
}
