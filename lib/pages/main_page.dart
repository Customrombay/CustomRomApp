import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';

import '../pages/roms_page.dart';
import '../widgets/drawer.dart';
import '../tools/check_support.dart';
import '../tools/rom_for_device.dart';
import '../tools/support_status.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MainPage> {
  Future<AndroidDeviceInfo> androidInfo = DeviceInfoPlugin().androidInfo;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text(
          "CustomRomApp",
          style: TextStyle(
            color: Color.fromARGB(255, 65, 219, 134)
          )
        ),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 65, 219, 134)
        ),
      ),
      drawer: const NavigationDrawerWidget(),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: FutureBuilder<AndroidDeviceInfo>(
          future: androidInfo,
          builder: (BuildContext context, AsyncSnapshot<AndroidDeviceInfo> snapshot) {
            if (snapshot.hasData) {
              AndroidDeviceInfo newInfo = snapshot.data!;
              return buildDeviceInfo(
                androidInfo: newInfo
              );
            }
            else {
              return const Text('Calculating answer...');
            }
          }
        )
      )
    );
  }

  Widget buildDeviceInfo({required AndroidDeviceInfo androidInfo}) {
    Future<SupportStatus> supportStatus = checkSupport (
      readCodename: androidInfo.board,
      readVendor: androidInfo.manufacturer,
      readProduct: androidInfo.product
    );
    return ListView(
      children: [
        const Center(
          child: Text(
            "This device seems to be:",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        Center(
          child: Text(
            "${androidInfo.manufacturer} ${androidInfo.model}",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        FutureBuilder<SupportStatus>(
          future: supportStatus,
          builder: (BuildContext context, AsyncSnapshot<SupportStatus> snapshot) {
            if (snapshot.hasData) {
              String extendedCodename = snapshot.data!.extendedCodename;
              String codename = extendedCodename.split("-").last;
              // bool isSupported = snapshot.data!.isSupported;
              List<RomForDevice> listOfCustomRoms = snapshot.data!.listOfCustomRoms;
              return Column(
                children: [
                  const Center(
                    child: Text(
                      "Codename:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      codename,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                    child: Text(
                      "Extended codename:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      extendedCodename,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                    child: Text(
                      "It is supported by:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      listOfCustomRoms.length.toString(),
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      "custom ROMs",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => RomsPage(listOfRoms: listOfCustomRoms),
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              const begin = Offset(1.0, 0.0);
                              const end = Offset.zero;
                              const curve = Curves.ease;
                                  
                              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                  
                              return SlideTransition(
                                position: animation.drive(tween),
                                child: child,
                              );
                            },
                          )
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_circle_right,
                        size: 110,
                        color: Color.fromARGB(255, 65, 219, 134),
                      ),
                    ),
                  )
                  // ListOfSupportedRomsView(listOfRoms: snapshot.data!.listOfCustomRoms)
                ],
              );
            }
            else if (snapshot.hasError) {
              return const Center(
                child: Text(
                  "Connect to the Internet to check for available ROMs"
                ),
              );
            }
            else {
              return const Center(
                child: Text(
                  "Loading..."
                ),
              );
            }
          }
        ),
      ],
    );
  }
}
