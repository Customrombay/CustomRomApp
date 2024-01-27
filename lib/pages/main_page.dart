import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';

import '../widgets/drawer.dart';
import '../widgets/custom_rom_device_image.dart';
import '../widgets/list_of_supported_roms_view.dart';
import '../widgets/list_of_supported_recoveries_view.dart';
import '../widgets/list_of_supported_distributions_view.dart';
import '../widgets/unsupported_device_view.dart';
import '../tools/check_support.dart';
import '../tools/custom_rom_device.dart';
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
        FutureBuilder<SupportStatus>(
          future: supportStatus,
          builder: (BuildContext context, AsyncSnapshot<SupportStatus> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isSupported) {
                String extendedCodename = snapshot.data!.extendedCodename;
                // String codename = extendedCodename.split("-").last;
                CustomRomDevice? customRomDevice = snapshot.data!.customRomDevice;
                // bool isSupported = snapshot.data!.isSupported;
                List<RomForDevice> listOfCustomRoms = customRomDevice?.listOfRoms ?? [];
                return Column(
                  children: [
                    CustomRomDeviceImage(
                      extendedCodename: extendedCodename
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${customRomDevice!.deviceVendor} ${customRomDevice.deviceModelName}".replaceAll("/ ", "/\n"),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                      textAlign: TextAlign.center,
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
                        "Supported by",
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
                        "custom ROMs in our database.",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    ListOfSupportedRomsView(customRomDevice: customRomDevice),
                    ListOfSupportedRecoveriesView(customRomDevice: customRomDevice),
                    ListOfSupportedDistributionsView(customRomDevice: customRomDevice)
                  ],
                );
              }
              else {
                return UnsupportedDeviceView(
                  deviceInfo: androidInfo,
                );
              }
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
