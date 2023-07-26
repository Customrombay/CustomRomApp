import 'custom_rom_device.dart';

class SupportStatus {
  SupportStatus({
    required this.isSupported,
    required this.extendedCodename,
    this.customRomDevice
  });

  bool isSupported;
  String extendedCodename;
  CustomRomDevice? customRomDevice;
}