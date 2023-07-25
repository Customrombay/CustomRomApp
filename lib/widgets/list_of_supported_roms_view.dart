import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../tools/rom_for_device.dart';
import '../tools/rom_data_generator.dart';

class ListOfSupportedRomsView extends StatelessWidget {

  const ListOfSupportedRomsView({
    Key? key,
    required this.listOfRoms
  }) : super(key: key);

  final List<RomForDevice> listOfRoms;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listOfRoms.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(listOfRoms[index].romName),
          subtitle: Text(romDataGenerator(rom: listOfRoms[index])),
          onTap: () {
            Uri? url = Uri.tryParse(listOfRoms[index].phoneWebpage);
            if (url?.hasAbsolutePath ?? false) {
              launchUrl(
                url!,
                mode: LaunchMode.externalApplication
              );
            }
          },
        );
      });
  }
}