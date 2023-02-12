import 'package:flutter/material.dart';

class SpecTable extends StatefulWidget {
  const SpecTable({
    super.key,
    required this.cpuName,
    required this.numberOfCores,
    required this.cpuArchitecture,
    // required this.cpuProcess,
    required this.cpuVendor,
    required this.deviceModel,
    required this.deviceManufacturer,
    required this.deviceBrand,
    required this.boardName,
    required this.hardwareName,
    required this.screenSize
  });

  final String cpuName;
  final String numberOfCores;
  final String cpuArchitecture;
  // final String cpuProcess;
  final String cpuVendor;
  final String deviceModel;
  final String deviceManufacturer;
  final String deviceBrand;
  final String boardName;
  final String hardwareName;
  final String screenSize;

  @override
  State<SpecTable> createState() => _SpecTableState();
}

class _SpecTableState extends State<SpecTable> {

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            const Text(
              "CPU model"
            ),
            Text(
              widget.cpuName
            )
          ]
        ),
        TableRow(
          children: [
            const Text(
              "Number of cores"
            ),
            Text(
              widget.numberOfCores
            )
          ]
        ),
        TableRow(
          children: [
            const Text(
              "CPU architecture"
            ),
            Text(
              widget.cpuArchitecture
            )
          ]
        ),
        // TableRow(
        //   children: [
        //     const Text(
        //       "CPU process"
        //     ),
        //     Text(
        //       widget.cpuProcess
        //     )
        //   ]
        // ),
        TableRow(
          children: [
            const Text(
              "CPU vendor"
            ),
            Text(
              widget.cpuVendor
            )
          ]
        ),
        TableRow(
          children: [
            const Text(
              "Device model"
            ),
            Text(
              widget.deviceModel
            )
          ]
        ),
        TableRow(
          children: [
            const Text(
              "Manufacturer"
            ),
            Text(
              widget.deviceManufacturer
            )
          ]
        ),
        TableRow(
          children: [
            const Text(
              "Brand"
            ),
            Text(
              widget.deviceBrand
            )
          ]
        ),
        TableRow(
          children: [
            const Text(
              "Board"
            ),
            Text(
              widget.boardName
            )
          ]
        ),
        TableRow(
          children: [
            const Text(
              "Hardware"
            ),
            Text(
              widget.hardwareName
            )
          ]
        ),
        TableRow(
          children: [
            const Text(
              "Screen size"
            ),
            Text(
              widget.screenSize
            )
          ]
        )
      ],
    );
  }
}