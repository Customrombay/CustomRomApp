class RomForDevice {
  RomForDevice({
    required this.romName,
    required this.romSupport,
    required this.romState,
    required this.androidVersion,
    required this.romNotes,
    required this.romWebpage,
    required this.phoneWebpage
  });

  String romName;
  bool romSupport;
  String romState;
  String androidVersion;
  String romNotes;
  String romWebpage;
  String phoneWebpage;
}
