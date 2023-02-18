import 'package:http/http.dart' as http;
import 'package:yaml/yaml.dart';

Future<bool> checkIfSupported({required String extendedCodename}) async {
  // print("OK");
  var response = await http.get(Uri.parse("https://api.github.com/repos/Customrombay/database/contents/database/phone_data/"));
  if (response.statusCode == 200) {
    YamlList ydoc = loadYaml(response.body);
    for (var deviceFile in ydoc) {
      if (deviceFile["name"] == "$extendedCodename.yaml") {
        return true;
      }
    }
  }
  return false;
}