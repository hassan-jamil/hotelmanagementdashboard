import 'package:flutter/material.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const HotelApp());
}

class HotelApp extends StatelessWidget {
  const HotelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hotel Management",
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: AppRoutes.splashScreen,
    );
  }
}
