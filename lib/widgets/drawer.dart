import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatefulWidget {

  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  // Future<void> _changeIsDev() async {
  //   final SharedPreferences prefs = await _prefs;
  //   final bool isDev = !(prefs.getBool('isDev') ?? false);

  //   setState(() {
  //     _isDev = prefs.setBool('isDev', isDev).then((bool success) {
  //       return isDev;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: const Color(0xff2a328e),
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: 'https://www.lo3.gdynia.pl/wp-content/uploads/2021/01/logo.png',
              name: 'TriApp',
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

  Widget buildHeader({required String urlImage, required String name,}) {
    return InkWell(
      child: Container(
        padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
        child: Row(
          children: [
            // Container(
            //   width: 120,
            //   height: 70,
            //   color: Colors.white,
            //   // child: Image.network(
            //   //   urlImage,
            //   //   fit: BoxFit.cover,
            //   // ),
            //   child: CachedNetworkImage(
            //     imageUrl: urlImage,
            //     //fit: BoxFit.fitWidth,
            //     height: 200,
            //     width: 400,
            //     placeholder: (context, url) => loadingPlaceHolder,
            //     errorWidget: (context, url, error) => const Icon(Icons.error),
            //   ),
            // ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
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
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void goToPage(BuildContext context, int index) {
    Navigator.of(context).pop();

    // switch (index) {
    //   case 0:
    //     Navigator.of(context).push(MaterialPageRoute(
    //       builder: (context) => PlanPage(title: "Plan Lekcji", themeManageri: widget.themeManageri,),
    //     ));
    //     break;
    //   case 1:
    //     Navigator.of(context).push(MaterialPageRoute(
    //       builder: (context) => SubPage(themeManageri: widget.themeManageri),
    //     ));
    //     break;
    //   case 2:
    //     Navigator.of(context).push(MaterialPageRoute(
    //       builder: (context) => PlhPage(themeManageri: widget.themeManageri),
    //     ));
    //     break;
    //     case 3:
    //     Navigator.of(context).push(MaterialPageRoute(
    //       builder: (context) => NewsPage(themeManageri: widget.themeManageri),
    //     ));
    //     break;
    //     case 4:
    //     Navigator.of(context).push(MaterialPageRoute(
    //       builder: (context) => RecentPage(themeManageri: widget.themeManageri),
    //     ));
    //     break;
    //     case 5:
    //     Navigator.of(context).push(MaterialPageRoute(
    //       builder: (context) => SettingsPage(themeManageri: widget.themeManageri),
    //     ));
    //     break;
    // }
  }

  List<Widget> buildList() {
    return [
      buildMenuItem(
        text: 'Plan lekcji',
        icon: Icons.grid_on,
        onClicked: () => goToPage(context, 0),
      ),
      const SizedBox(height: 16),
      buildMenuItem(
        text: 'Zastępstwa',
        icon: Icons.compare_arrows,
        onClicked: () => goToPage(context, 1),
      ),
      const SizedBox(height: 16),
      const Divider(color: Colors.white),
      const SizedBox(height: 16),
      buildMenuItem(
        text: 'Gazetka szkolna',
        icon: Icons.newspaper,
        onClicked: () => goToPage(context, 3),
      ),
      const SizedBox(height: 16),
      buildMenuItem(
        text: 'Aktualności',
        icon: Icons.notifications_outlined,
        onClicked: () => goToPage(context, 4),
      ),
      const SizedBox(height: 16),
      const Divider(color: Colors.white),
      const SizedBox(height: 16),
      buildMenuItem(
        text: 'Ustawienia',
        icon: Icons.settings,
        onClicked: () => goToPage(context, 5),
      ),
      //Text(widget.themeManageri.isDeveloper.toString())
    ];
  }
}