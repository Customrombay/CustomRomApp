import 'package:flutter/material.dart';

import 'pages/specs_page.dart';
import 'pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      initialRoute: "/MainPage",
      routes: {
        "/MainPage":(context) => const MainPage(),
        "/SpecsPage":(context) => const SpecsPage()
      },
      home: const MainPage()
    );
  }
}
