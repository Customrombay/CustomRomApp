import 'package:flutter/material.dart';

import 'spec_table_entry.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                children: [
                  SpecTableEntry(
                    leftValue: "CPU model",
                    rightValue: widget.cpuName
                  ),
                  const Divider(
                    height: 10,
                    color: Color.fromARGB(255, 65, 219, 134),
                    indent: 10,
                    endIndent: 10,
                  ),
                  SpecTableEntry(
                    leftValue: "Number of cores",
                    rightValue: widget.numberOfCores
                  ),
                  const Divider(
                    height: 10,
                    color: Color.fromARGB(255, 65, 219, 134),
                    indent: 10,
                    endIndent: 10,
                  ),
                  SpecTableEntry(
                    leftValue: "CPU architecture",
                    rightValue: widget.cpuArchitecture
                  ),
                  const Divider(
                    height: 10,
                    color: Color.fromARGB(255, 65, 219, 134),
                    indent: 10,
                    endIndent: 10,
                  ),
                  SpecTableEntry(
                    leftValue: "CPU vendor",
                    rightValue: widget.cpuVendor
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                children: [
                  SpecTableEntry(
                    leftValue: "Device model",
                    rightValue: widget.deviceModel
                  ),
                  const Divider(
                    height: 10,
                    color: Color.fromARGB(255, 65, 219, 134),
                    indent: 10,
                    endIndent: 10,
                  ),
                  SpecTableEntry(
                    leftValue: "Manufacturer",
                    rightValue: widget.deviceManufacturer
                  ),
                  const Divider(
                    height: 10,
                    color: Color.fromARGB(255, 65, 219, 134),
                    indent: 10,
                    endIndent: 10,
                  ),
                  SpecTableEntry(
                    leftValue: "Brand",
                    rightValue: widget.deviceBrand
                  ),
                  const Divider(
                    height: 10,
                    color: Color.fromARGB(255, 65, 219, 134),
                    indent: 10,
                    endIndent: 10,
                  ),
                  SpecTableEntry(
                    leftValue: "Board",
                    rightValue: widget.boardName
                  ),
                  const Divider(
                    height: 10,
                    color: Color.fromARGB(255, 65, 219, 134),
                    indent: 10,
                    endIndent: 10,
                  ),
                  SpecTableEntry(
                    leftValue: "Hardware",
                    rightValue: widget.hardwareName
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}