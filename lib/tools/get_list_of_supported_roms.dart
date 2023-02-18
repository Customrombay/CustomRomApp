import 'package:customromapp/tools/rom_for_device.dart';
import 'package:http/http.dart' as http;
import 'package:yaml/yaml.dart';

Future<List<RomForDevice>> getListOfSupportedRoms({required String extendedCodename}) async {
  List<RomForDevice> listOfSupportedRoms = [];
  var response = await http.get(Uri.parse("https://customrombay.org/database/phone_data/$extendedCodename.yaml"));
  if (response.statusCode == 200) {
    YamlMap ydoc = loadYaml(response.body);
    YamlList listOfRoms = ydoc["roms"];
    for (var rom in listOfRoms) {
      listOfSupportedRoms += [RomForDevice(
        romName: rom["rom-name"],
        romSupport: rom["rom-support"],
        romState: rom["rom-state"],
        androidVersion: rom["android-version"].toString(),
        romWebpage: rom["rom-webpage"],
        phoneWebpage: rom["phone-webpage"]
      )];
    }
  }
  return listOfSupportedRoms;
}
