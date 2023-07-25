import 'package:customromapp/tools/rom_for_device.dart';
import 'package:yaml/yaml.dart';

List<RomForDevice> getListOfSupportedRoms({required String responseContent}) {
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
  return listOfSupportedRoms;
}
