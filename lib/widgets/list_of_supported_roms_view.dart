import 'package:customromapp/tools/rom_for_device.dart';
import 'package:customromapp/widgets/rom_view.dart';
import 'package:flutter/material.dart';

class ListOfSupportedRomsView extends StatelessWidget {

  const ListOfSupportedRomsView({
    Key? key,
    required this.listOfRoms
  }) : super(key: key);

  final List<RomForDevice> listOfRoms;

  @override
  Widget build(BuildContext context) {
    List<Widget> listOfRomViews = [];
    for (RomForDevice rom in listOfRoms) {
      listOfRomViews += [RomView(rom: rom)];
    }
    return Column(
      children: listOfRomViews
    );
  }
}