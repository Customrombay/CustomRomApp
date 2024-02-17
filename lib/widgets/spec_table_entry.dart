import 'package:flutter/material.dart';

class SpecTableEntry extends StatefulWidget {
  const SpecTableEntry({
    super.key,
    required this.leftValue,
    required this.rightValue,
  });

  final String leftValue;
  final String rightValue;

  @override
  State<SpecTableEntry> createState() => _SpecTableEntryState();
}

class _SpecTableEntryState extends State<SpecTableEntry> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.leftValue
        ),
        Text(
          widget.rightValue
        ),
      ]
    );
  }
}