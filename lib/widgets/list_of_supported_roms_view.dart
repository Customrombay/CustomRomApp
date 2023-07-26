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
      itemCount: customRomDevice.listOfRoms.length,
      itemBuilder: (context, index) {
        if (index == 0) {
          // return const Image(
          //   image: AssetImage('assets/phone.png'),
          //   height: 300,
          // );
          return CustomRomDeviceImage(extendedCodename: extendedCodenameCreator(readCodename: customRomDevice.deviceName, readVendor: customRomDevice.deviceVendor));
        }
        else {
          return ListTile(
            title: Text(customRomDevice.listOfRoms[index - 1].romName),
            subtitle: Text(romDataGenerator(rom: customRomDevice.listOfRoms[index - 1])),
            onTap: () {
              Uri? url = Uri.tryParse(customRomDevice.listOfRoms[index - 1].phoneWebpage);
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