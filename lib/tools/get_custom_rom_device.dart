import 'package:customromapp/tools/recovery_for_device.dart';
import 'package:yaml/yaml.dart';

import 'custom_rom_device.dart';
import 'rom_for_device.dart';

CustomRomDevice getCustomRomDevice({required String responseContent}) {
  YamlMap ydoc = loadYaml(responseContent);
  List<RomForDevice> listOfSupportedRoms = [];
  YamlList listOfRoms = ydoc["roms"];
  for (var rom in listOfRoms) {
    listOfSupportedRoms += [RomForDevice(
      romName: rom["rom-name"],
      romSupport: rom["rom-support"],
      romState: rom["rom-state"],
      androidVersion: rom["android-version"].toString(),
      romNotes: rom["rom-notes"] ?? "",
      romWebpage: rom["rom-webpage"] ?? "",
      phoneWebpage: rom["phone-webpage"] ?? ""
    )];
  }

  List<RecoveryForDevice> listOfSupportedRecoveries =[];
  YamlList listOfRecoveries = ydoc["recoveries"];
  for (var recovery in listOfRecoveries) {
    listOfSupportedRecoveries += [RecoveryForDevice(
      recoveryName: recovery["recovery-name"],
      recoverySupport: recovery["recovery-support"],
      recoveryState: recovery["recovery-state"],
      recoveryNotes: recovery["recovery-notes"],
      recoveryWebpage: recovery["recovery-webpage"],
      deviceWebpage: recovery["device-webpage"]
    )];
  }

  return CustomRomDevice(
    deviceName: ydoc["device-name"],
    deviceVendor: ydoc["device-vendor"],
    deviceModelName: ydoc["device-model-name"],
    deviceDescription: ydoc["device-description"] ?? "",
    listOfRoms: listOfSupportedRoms,
    listOfRecoveries: listOfSupportedRecoveries
  );
}
