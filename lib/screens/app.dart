import 'package:courtbook/screens/booking/booking_screen.dart';
import 'package:courtbook/screens/favorite/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:courtbook/core/theme.dart';
import 'package:courtbook/screens/splash/splash_screen.dart';
import 'package:courtbook/screens/profile/profile_screen.dart';
import 'package:courtbook/screens/home/home_screen.dart';
import 'package:courtbook/screens/main_screen.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => const SplashScreen()),
        GetPage(name: '/main', page: () => const MainScreen()),
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/favorite', page: () => const FavoriteScreen()),
        GetPage(name: '/profile', page: () => const ProfileScreen()),
        GetPage(name: '/booking', page: () => const BookingScreen()),
      ],
    );
  }
}
