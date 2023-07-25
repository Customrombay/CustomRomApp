import 'package:flutter/material.dart';

import '../widgets/list_of_supported_roms_view.dart';
import '../tools/rom_for_device.dart';

class RomsPage extends StatefulWidget {
  const RomsPage({
    super.key,
    required this.listOfRoms
  });

  final List<RomForDevice> listOfRoms;

  @override
  State<RomsPage> createState() => _RomsPageState();
}

class _RomsPageState extends State<RomsPage> {

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
      body: Center(
        child: ListOfSupportedRomsView(
          listOfRoms: widget.listOfRoms
        )
      )
    );
  }
}
