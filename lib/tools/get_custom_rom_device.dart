import 'package:yaml/yaml.dart';

import 'custom_rom_device.dart';
import 'rom_for_device.dart';

CustomRomDevice getCustomRomDevice({required String responseContent}) {
  List<RomForDevice> listOfSupportedRoms = [];
  YamlMap ydoc = loadYaml(responseContent);
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
  return CustomRomDevice(
    deviceName: ydoc["device-name"],
    deviceVendor: ydoc["device-vendor"],
    deviceModelName: ydoc["device-model-name"],
    deviceDescription: ydoc["device-description"] ?? "",
    listOfRoms: listOfSupportedRoms
  );
}
