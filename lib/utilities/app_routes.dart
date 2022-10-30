import 'package:api/screen/salary_screen/salary_screen.dart';
import 'package:flutter/material.dart';

import '../screen/category_details_screen/category_details_screen.dart';
import '../screen/home_screen/home_screen.dart';
import '../screen/splash_screen/splash_screen.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  SalaryScreen.routeName: (context) => const SalaryScreen(),
  CategoryDetailsScreen.routeName: (context) => const CategoryDetailsScreen(),
};
