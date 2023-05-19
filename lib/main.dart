import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:plansteria/app/app.bottomsheets.dart';
import 'package:plansteria/app/app.dialogs.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.snackbars.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'app/app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await setupLocator();
  await setupSnackbarUI();
  setupDialogUi();
  setupBottomSheetUi();
  await ThemeManager.initialise();

  runApp(const App());
}
