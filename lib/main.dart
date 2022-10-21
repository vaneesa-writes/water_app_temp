import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:water_quality_app/screens/afterlogin.dart';
import 'package:water_quality_app/screens/prediction.dart';
import 'package:water_quality_app/screens/preview_inputs.dart';

import 'screens/login.dart';
import 'screens/register.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyLogin(),
    routes: {
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),
      'home_screen': (context) => AfterLogin(),
      'review_inputs': (context) => PreviewInputs(),
      'predict': (context) => Prediction(),
    },
  ));
}
