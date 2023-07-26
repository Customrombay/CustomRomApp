import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../tools/custom_rom_device.dart';
import '../tools/recovery_for_device.dart';

class ListOfSupportedRecoveriesView extends StatefulWidget {
  const ListOfSupportedRecoveriesView({
    super.key,
    required this.customRomDevice
  });

  final CustomRomDevice customRomDevice;

  @override
  State<ListOfSupportedRecoveriesView> createState() => _ListOfSupportedRecoveriesViewState();
}

class _ListOfSupportedRecoveriesViewState extends State<ListOfSupportedRecoveriesView> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text("Custom recoveries"),
      // subtitle: Text(""),
      children: buildListOfSupportedRecoveryViews()
    );
  }

  List<Widget> buildListOfSupportedRecoveryViews() {
    List<Widget> listOfSupportedRomViews = [];
    for (RecoveryForDevice recovery in widget.customRomDevice.listOfRecoveries) {
      listOfSupportedRomViews += [
        ListTile(
          title: Text(recovery.recoveryName),
          subtitle: Text(recovery.recoveryState),
          onTap: () {
            Uri? url = Uri.tryParse(recovery.deviceWebpage ?? recovery.recoveryWebpage ?? "");
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