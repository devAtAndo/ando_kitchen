import 'package:ando_kitchen_order/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'viewmodels/viewmodels.dart';

void main() async {
  // locatorSetUp();
  WidgetsFlutterBinding.ensureInitialized();
  // await serviceLocator<DatabaseService>().initDatabase();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(
      (MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => SignInViewmodel(),
          )
        ],
        child: const AndoApp(),
      )),
    );
  });
}
