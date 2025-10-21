import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_routes.dart';
import 'routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Theory Test App',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.SPLASH,
      getPages: AppPages.pages,
    );
  }
}
