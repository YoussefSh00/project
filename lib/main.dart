import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:royal_home/core/services/remote/service_locator.dart';
import 'package:royal_home/core/utils/app_keys.dart';
import 'app.dart';

main() async {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: AppKeys.apiKey,
            appId: AppKeys.appId,
            messagingSenderId: AppKeys.messagingSenderId,
            projectId: AppKeys.projectId));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const App());
}
