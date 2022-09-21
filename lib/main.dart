import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app_portofolio/routers/route.dart';
import 'package:flutter_app_portofolio/routers/route_name.dart';

import 'package:get/get.dart';
import 'controllers/firebase_auth_controller.dart';
import 'firebase_options.dart';
import 'views/home_screen.dart';
import 'views/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (const bool.fromEnvironment("USE_FIREBASE_EMU")) {
    await _configureFirebaseAuth();
  }

  runApp(MyApp());
}

Future<void> _configureFirebaseAuth() async {
  String configHost = const String.fromEnvironment("FIREBASE_EMU_URL");
  int configPort = const int.fromEnvironment("AUTH_EMU_PORT");
  var defaultHost = "10.0.2.2";
  var host = configHost.isNotEmpty ? configHost : defaultHost;
  var port = configPort != 0 ? configPort : 9099;
  await FirebaseAuth.instance.useAuthEmulator(host, port);
  debugPrint("Using Firebase Auth emulator on: $host:$port");
}

final a = FirebaseAuth.instance.authStateChanges().listen((User? user) {
  if (user == null) {
    print('User is currently signed out!');
  } else {
    print('User is signed in!');
  }
});

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final controller = Get.put(FirebaseAuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: controller.onAuthStateChanged,
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return GetMaterialApp(
            initialRoute:
                snapshot.data != null ? RoutesName.home : RoutesName.login,
            getPages: Pages.pages,
          );
        }
        return const Splash();
      }),
    );
  }
}
