import 'package:disaster_mapper/app/modules/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/controllers/auth_controller.dart';
import 'app/modules/utils/loading.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kOrangeRed),
      ),
      home: FutureBuilder(
        future: _initializeAppData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamBuilder<User?>(
              stream: authC.streamAuthStatus,
              builder: (context, snapshot) {
                print(snapshot.data);
                if (snapshot.connectionState == ConnectionState.active) {
                  return GetMaterialApp(
                    title: "Application",
                    // initialRoute:
                    getPages: AppPages.routes,
                    initialRoute: snapshot.data != null &&
                            snapshot.data!.emailVerified == true
                        ? Routes.BOTTOM_USER
                        : Routes.LOGIN,
                  );
                }
                return Loading();
              },
            );
          } else {
            return Loading();
          }
        },
      ),
    );
  }
}

Future<void> _initializeAppData() async {
  await Future.delayed(
    Duration(
      seconds: 4,
    ),
  );
}
