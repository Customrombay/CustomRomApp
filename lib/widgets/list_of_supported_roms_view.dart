import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom_rom_device_image.dart';
import '../tools/custom_rom_device.dart';
import '../tools/rom_data_generator.dart';
import '../tools/extended_codename_creator.dart';

class ListOfSupportedRomsView extends StatelessWidget {

  const ListOfSupportedRomsView({
    Key? key,
    required this.customRomDevice
  }) : super(key: key);

  final CustomRomDevice customRomDevice;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: customRomDevice.listOfRoms.length + 3,
      itemBuilder: (context, index) {
        if (index == 0) {
          return CustomRomDeviceImage(
            extendedCodename: extendedCodenameCreator(
              readCodename: customRomDevice.deviceName,
              readVendor: customRomDevice.deviceVendor
            )
          );
        }
        else if (index == 1) {
          return const SizedBox(
            height: 20,
          );
        }
        else if (index == 2) {
          return Text(
            "${customRomDevice.deviceVendor} ${customRomDevice.deviceModelName}".replaceAll("/ ", "/\n"),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
            textAlign: TextAlign.center,
          );
        }
        else {
          return ListTile(
            title: Text(customRomDevice.listOfRoms[index - 3].romName),
            subtitle: Text(romDataGenerator(rom: customRomDevice.listOfRoms[index - 3])),
            onTap: () {
              Uri? url = Uri.tryParse(customRomDevice.listOfRoms[index - 3].phoneWebpage);
              if (url?.hasAbsolutePath ?? false) {
                launchUrl(
                  url!,
                  mode: LaunchMode.externalApplication
                );
              }
            },
          );
        }
      });
  }
}