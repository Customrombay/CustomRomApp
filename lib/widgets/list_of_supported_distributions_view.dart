import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../tools/custom_rom_device.dart';
import '../tools/linux_for_device.dart';

class ListOfSupportedDistributionsView extends StatefulWidget {
  const ListOfSupportedDistributionsView({
    super.key,
    required this.customRomDevice
  });

  final CustomRomDevice customRomDevice;

  @override
  State<ListOfSupportedDistributionsView> createState() => _ListOfSupportedDistributionsViewState();
}

class _ListOfSupportedDistributionsViewState extends State<ListOfSupportedDistributionsView> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text("Linux distributions"),
      children: buildListOfSupportedDistributionViews()
    );
  }

  List<Widget> buildListOfSupportedDistributionViews() {
    List<Widget> listOfSupportedRomViews = [];
    for (LinuxForDevice distribution in widget.customRomDevice.listOfLinuxDistributions) {
      listOfSupportedRomViews += [
        ListTile(
          title: Text(distribution.distributionName),
          subtitle: Text(distribution.distributionState),
          onTap: () {
            Uri? url = Uri.tryParse(distribution.deviceWebpage ?? distribution.distributionWebpage ?? "");
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