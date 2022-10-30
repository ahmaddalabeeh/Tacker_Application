import 'package:api/utilities/app_providers.dart';
import 'package:api/utilities/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/splash_screen/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appProviders,
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Abel',
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color.fromARGB(255, 131, 45, 45),
            secondary: Colors.blue,
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.routeName,
        routes: appRoutes,
      ),
    );
  }
}
