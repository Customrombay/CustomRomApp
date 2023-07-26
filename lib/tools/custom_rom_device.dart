import 'rom_for_device.dart';

class CustomRomDevice {
  CustomRomDevice({
    required this.deviceName,
    required this.deviceVendor,
    required this.deviceModelName,
    required this.deviceDescription,
    required this.listOfRoms,
    // required this.listOfRecoveries,
    // required this.listOfLinuxDistributions,
  });

  String deviceName = "";
  String deviceVendor = "";
  String deviceModelName = "";
  String deviceDescription = "";
  List<RomForDevice> listOfRoms = [];
}