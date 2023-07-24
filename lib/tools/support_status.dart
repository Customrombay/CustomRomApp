import 'package:customromapp/tools/rom_for_device.dart';

class SupportStatus {
  SupportStatus({
    required this.isSupported,
    required this.extendedCodename,
    required this.listOfCustomRoms
  });

  bool isSupported;
  String extendedCodename;
  List<RomForDevice> listOfCustomRoms;
}