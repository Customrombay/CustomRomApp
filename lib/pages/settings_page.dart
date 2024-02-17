import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/drawer.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Color.fromARGB(255, 65, 219, 134)
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 65, 219, 134)
        ),
      ),
      drawer: const NavigationDrawerWidget(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: const Text("Open source licenses"),
                    subtitle: const Text("Show information about open source compenents"),
                    leading: const Icon(Icons.text_snippet),
                    onTap: () {
                      context.push("/LicensePage");
                    },
                  ),
                  ListTile(
                    title: const Text("About Custom ROM App"),
                    subtitle: const Text("See information about this app"),
                    leading: const Icon(Icons.info),
                    onTap: () {
                      context.push("/AboutPage");
                    }
                  )
                ]
              ),
            ),
          ]
        )
      ),
    );
  }
}
