import 'package:http/http.dart' as http;

import 'support_status.dart';
import 'extended_codename_creator.dart';
import 'get_custom_rom_device.dart';

Future<SupportStatus> checkSupport({
  required String readCodename,
  required String readVendor,
  required String readProduct
}) async {
  String extendedCodename = extendedCodenameCreator(readCodename: readCodename, readVendor: readVendor);
  var response = await http.get(Uri.parse("https://raw.githubusercontent.com/Customrombay/database/main/database/phone_data/$extendedCodename.yaml"));
  if (response.statusCode == 200) {
    return SupportStatus(
      isSupported: true,
      extendedCodename: extendedCodename,
      customRomDevice: getCustomRomDevice(responseContent: response.body)
    );
  }
  if (RegExp(r'.+_.+').hasMatch(readProduct)) {
    String newCodename = readProduct.split("_").last;
    String newExtendedCodename = extendedCodenameCreator(readCodename: newCodename, readVendor: readVendor);
    var newResponse = await http.get(Uri.parse("https://raw.githubusercontent.com/Customrombay/database/main/database/phone_data/$newExtendedCodename.yaml"));
    if (newResponse.statusCode == 200) {
      return SupportStatus(
        isSupported: true,
        extendedCodename: newExtendedCodename,
        customRomDevice: getCustomRomDevice(responseContent: newResponse.body)
      );
    }
  }
  else {
    String newExtendedCodename = extendedCodenameCreator(readCodename: readProduct, readVendor: readVendor);
    var newResponse = await http.get(Uri.parse("https://raw.githubusercontent.com/Customrombay/database/main/database/phone_data/$newExtendedCodename.yaml"));
    if (newResponse.statusCode == 200) {
      return SupportStatus(
        isSupported: true,
        extendedCodename: newExtendedCodename,
        customRomDevice: getCustomRomDevice(responseContent: newResponse.body)
      );
    }
  }
  return SupportStatus(
    isSupported: false,
    extendedCodename: extendedCodename,
  );
}