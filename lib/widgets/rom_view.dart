import 'package:customromapp/tools/rom_for_device.dart';
import 'package:flutter/material.dart';

class RomView extends StatefulWidget {

  const RomView({Key? key, required this.thisRom}) : super(key: key);

  final RomForDevice thisRom;

  @override
  State<RomView> createState() => _RomViewState();
}

class _RomViewState extends State<RomView> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.thisRom.romName);
  }
}