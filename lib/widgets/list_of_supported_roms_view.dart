import 'package:customromapp/tools/rom_for_device.dart';
import 'package:flutter/material.dart';
import 'rom_view.dart';
import '../tools/get_list_of_supported_roms.dart';

class ListOfSupportedRomsView extends StatefulWidget {

  const ListOfSupportedRomsView({Key? key, required this.extendedCodename}) : super(key: key);

  final String extendedCodename;

  @override
  State<ListOfSupportedRomsView> createState() => _ListOfSupportedRomsViewState();
}

class _ListOfSupportedRomsViewState extends State<ListOfSupportedRomsView> {
  @override
  Widget build(BuildContext context) {
    Future<List<RomForDevice>> listOfSupportedRoms = getListOfSupportedRoms(extendedCodename: widget.extendedCodename);
    return FutureBuilder<List<RomForDevice>>(
      future: listOfSupportedRoms,
      builder: (BuildContext context, AsyncSnapshot<List<RomForDevice>> snapshot) {
        if (snapshot.hasData) {
          List<RomForDevice> listOfSupportedRomsNow = snapshot.data!;
          List<Widget> listOfRomViews = [];
          for (RomForDevice rom in listOfSupportedRomsNow) {
            listOfRomViews += [
              RomView(
                thisRom: rom
              )
            ];
          }
          return Column(
            children: listOfRomViews,
          );
        }
        else if (snapshot.hasError) {
          return const Center(
            child: Text(
              "There was a problem while loading a list of supported custom ROMs"
            ),
          );
        }
        else {
          return const Center(
            child: Text(
              "Loading..."
            ),
          );
        }
      }
    );
  }
}