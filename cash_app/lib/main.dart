import 'package:cash_app/pages/detail_page.dart';
import 'package:cash_app/pages/login_page.dart';
import 'package:cash_app/pages/main_page.dart';
import 'package:cash_app/pages/pemasukan_page.dart';
import 'package:cash_app/pages/pengeluaran_page.dart';
import 'package:cash_app/pages/setting_page.dart';
import 'package:cash_app/shared/constant.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF00BCD4),
          secondary: const Color(0xFF80DEEA),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        AppConstants.routeLogin: (context) => const LoginPage(),
        AppConstants.routeMain: (context) => const MainPage(),
        AppConstants.routePengeluaran: (context) => const PengeluaranPage(),
        AppConstants.routePemasukan: (context) => const PemasukanPage(),
        AppConstants.routeDetail: (context) => const DetailPage(),
        AppConstants.routeSetting: (context) => const SettingPage(),
      },
    );
  }
}
