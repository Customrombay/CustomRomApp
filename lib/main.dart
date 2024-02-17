import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'pages/specs_page.dart';
import 'pages/main_page.dart';
import 'pages/settings_page.dart';
import 'pages/post_page.dart';
import 'pages/license_page.dart';
import 'pages/about_page.dart';

void main() {
  runApp(const MyApp());
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainPage(),
    ),
    GoRoute(
      path: '/SettingsPage',
      builder: (context, state) => const SettingsPage(),
    ),
    GoRoute(
      path: '/SpecsPage',
      builder: (context, state) => const SpecsPage(),
    ),
    GoRoute(
      path: "/PostPage",
      builder: (context, state) => const PostPage(),
    ),
    GoRoute(
      path: "/LicensePage",
      builder: (context, state) => const CustomLicensePage(),
    ),
    GoRoute(
      path: "/AboutPage",
      builder: (context, state) => const AboutPage(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color.fromARGB(255, 65, 219, 134),
        useMaterial3: true,
        primaryIconTheme: const IconThemeData(
          color: Color.fromARGB(255, 65, 219, 134)
        ),
        dividerColor: const Color.fromARGB(255, 65, 219, 134),
        expansionTileTheme: const ExpansionTileThemeData(iconColor: Color.fromARGB(255, 65, 219, 134))
        // act
      ),
      routerConfig: _router,
    );
  }
}
