import 'package:flutter/material.dart';

import '../widgets/list_of_supported_roms_view.dart';
import '../tools/custom_rom_device.dart';

class DevicePage extends StatefulWidget {
  const DevicePage({
    super.key,
    required this.customRomDevice
  });

  final CustomRomDevice customRomDevice;

  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: ListOfSupportedRomsView(
        customRomDevice: widget.customRomDevice
      ),
    );
  }
}
