import 'rom_for_device.dart';

String romDataGenerator({required RomForDevice rom}) {
  String output = "";
  if (!rom.romSupport) {
    output = "No";
    return output;
  }
  else {
    if (rom.romState == "") {
      output = "Yes";
      if ((rom.androidVersion == "" || rom.androidVersion == "null") && (rom.romNotes == "" || rom.romNotes == "null")){
        return output;
      }
      else if (rom.androidVersion != "" && rom.androidVersion != "null") {
        output += " (Android: ${rom.androidVersion})";
        return output;
      }
      else {
        output += " (${rom.romNotes})";
        return output;
      }
    }
    else {
      output = rom.romState;
      if ((rom.androidVersion == "" || rom.androidVersion == "null") && (rom.romNotes == "" || rom.romNotes == "null")){
        return output;
      }
      else if (rom.androidVersion != "" && rom.androidVersion != "null") {
        output += " (Android: ${rom.androidVersion})";
        return output;
      }
      else {
        output += " (${rom.romNotes})";
        return output;
      }
    }
  }
}