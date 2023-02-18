import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:system_info2/system_info2.dart';

import '../widgets/spec_table.dart';
import '../widgets/drawer.dart';
import '../widgets/list_of_supported_roms_view.dart';
import '../tools/get_cpu_name.dart';
import '../tools/extended_codename_creator.dart';
import '../tools/check_if_supported.dart';
import '../tools/get_list_of_supported_roms.dart';

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
    String extendedCodename = extendedCodenameCreator(
      readCodename: androidInfo.board,
      readVendor: androidInfo.manufacturer
    );
    Future<bool> isSupported = checkIfSupported(extendedCodename: extendedCodename);
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
            androidInfo.board,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold
            ),
          ),
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
        FutureBuilder<bool>(
          future: isSupported,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData) {
              bool isSupportedNow = snapshot.data!;
              return ListOfSupportedRomsView(extendedCodename: extendedCodename);
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
        )
      ],
    );
  }
}
