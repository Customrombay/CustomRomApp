import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../tools/custom_rom_device.dart';
import '../tools/rom_data_generator.dart';
import '../tools/rom_for_device.dart';

class ListOfSupportedRomsView extends StatefulWidget {
  const ListOfSupportedRomsView({
    super.key,
    required this.customRomDevice
  });

  final CustomRomDevice customRomDevice;

  @override
  State<ListOfSupportedRomsView> createState() => _ListOfSupportedRomsViewState();
}

class _ListOfSupportedRomsViewState extends State<ListOfSupportedRomsView> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text("Custom ROMs"),
      // subtitle: Text(""),
      children: buildListOfSupportedRomViews()
    );
  }

  List<Widget> buildListOfSupportedRomViews() {
    List<Widget> listOfSupportedRomViews = [];
    for (RomForDevice rom in widget.customRomDevice.listOfRoms) {
      listOfSupportedRomViews += [
        ListTile(
          title: Text(rom.romName),
          subtitle: Text(romDataGenerator(rom: rom)),
          onTap: () {
            Uri? url = Uri.tryParse(rom.phoneWebpage);
            if (url?.hasAbsolutePath ?? false) {
              launchUrl(
                url!,
                mode: LaunchMode.externalApplication
              );
            }
          },
        )
      ];
    }
    return listOfSupportedRomViews;
  }
}