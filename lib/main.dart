import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'firebase_options.dart';
import 'package:encurtei_ly/app/app.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();

await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform
 );

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));


  runApp(const AppWidget());
}
