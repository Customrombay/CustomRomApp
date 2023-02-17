import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:system_info2/system_info2.dart';

import '../widgets/spec_table.dart';
import '../widgets/drawer.dart';
import '../tools/get_cpu_name.dart';

class SpecsPage extends StatefulWidget {
  const SpecsPage({super.key});

  @override
  State<SpecsPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SpecsPage> {
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
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 65, 219, 134)
        ),
      ),
      drawer: const NavigationDrawerWidget(),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView(
          children: [
            FutureBuilder<AndroidDeviceInfo>(
              future: androidInfo,
              builder: (BuildContext context, AsyncSnapshot<AndroidDeviceInfo> snapshot) {
                if (snapshot.hasData) {
                  AndroidDeviceInfo newInfo = snapshot.data!;
                  return SpecTable(
                    cpuName: getCpuName(),
                    numberOfCores: SysInfo.cores.length.toString(),
                    cpuArchitecture: SysInfo.cores.first.architecture.toString(),
                    // cpuProcess: SysInfo.,
                    cpuVendor: SysInfo.cores.first.vendor,
                    deviceModel: newInfo.model,
                    deviceManufacturer: newInfo.manufacturer,
                    deviceBrand: newInfo.brand,
                    boardName: newInfo.board,
                    hardwareName: newInfo.hardware,
                    screenSize: ((newInfo.displayMetrics.sizeInches * 100).round() / 100).toString()
                  );
                }
                else {
                  return const Text('Calculating answer...');
                }
              }
            )
          ],
        )
      ),
    );
  }
}
