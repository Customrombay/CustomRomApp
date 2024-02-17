import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationDrawerWidget extends StatefulWidget {

  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        // color: Colors.black87,
        child: ListView(
          children: <Widget>[
            InkWell(
              child: Container(
                padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
                child: const Center(
                  child:
                    SizedBox(
                      // width: 120,
                      height: 70,
                      child: Image(
                        image: AssetImage(
                          "assets/banner.png"
                        ),
                      )
                    ),
                ),
              ),
            ),
            Container(
              padding: padding,
              child: Column(
                children: buildList()
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    // const color = Colors.white;
    const hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: const Color.fromARGB(255, 65, 219, 134)),
      title: Text(text, style: const TextStyle(color: Color.fromARGB(255, 65, 219, 134))),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void goToPage(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        context.go("/");
        break;
      case 1:
        context.go("/PostPage");
        break;
      case 2:
        context.go("/SpecsPage");
        break;
      case 4:
      context.go("/SettingsPage");
        break;
    }
  }

  List<Widget> buildList() {
    return [
      buildMenuItem(
        text: 'Home',
        icon: Icons.home,
        onClicked: () => goToPage(context, 0),
      ),
      const SizedBox(height: 16),
      buildMenuItem(
        text: 'News',
        icon: Icons.newspaper,
        onClicked: () => goToPage(context, 1),
      ),
      const SizedBox(height: 16),
      const Divider(color: Color.fromARGB(255, 65, 219, 134)),
      const SizedBox(height: 16),
      buildMenuItem(
        text: 'Device specs',
        icon: Icons.developer_board,
        onClicked: () => goToPage(context, 2),
      ),
      const SizedBox(height: 16),
      buildMenuItem(
        text: 'SafetyNet check',
        icon: Icons.safety_check,
        onClicked: () => goToPage(context, 3),
      ),
      const SizedBox(height: 16),
      const Divider(color: Color.fromARGB(255, 65, 219, 134)),
      const SizedBox(height: 16),
      buildMenuItem(
        text: 'Settings',
        icon: Icons.settings,
        onClicked: () => goToPage(context, 4),
      ),
      //Text(widget.themeManageri.isDeveloper.toString())
    ];
  }
}