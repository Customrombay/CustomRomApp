import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';

class UnsupportedDeviceView extends StatefulWidget {
  const UnsupportedDeviceView({
    super.key,
    required this.deviceInfo,
  });

  final AndroidDeviceInfo deviceInfo;

  @override
  State<UnsupportedDeviceView> createState() => _UnsupportedDeviceViewState();
}

class _UnsupportedDeviceViewState extends State<UnsupportedDeviceView> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/phone.png",
          height: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        // Text(
        //   "${customRomDevice!.deviceVendor} ${customRomDevice.deviceModelName}".replaceAll("/ ", "/\n"),
        //   style: const TextStyle(
        //     fontWeight: FontWeight.bold,
        //     fontSize: 20
        //   ),
        //   textAlign: TextAlign.center,
        // ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            "Manufacturer: ${widget.deviceInfo.manufacturer}",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        widget.deviceInfo.manufacturer != widget.deviceInfo.brand
        ? Center(
          child: Text(
            "Brand: ${widget.deviceInfo.brand}",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
        )
        : const SizedBox(),
        Center(
          child: Text(
            "Board: ${widget.deviceInfo.board}",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        Center(
          child: Text(
            "Device: ${widget.deviceInfo.device}",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        Center(
          child: Text(
            "Model: ${widget.deviceInfo.model}",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        // Center(
        //   child: Text(
        //     extendedCodename,
        //     style: const TextStyle(
        //       fontSize: 22,
        //       fontWeight: FontWeight.bold
        //     ),
        //   ),
        // ),
        const SizedBox(
          height: 10,
        ),
        const Center(
          child: Text(
            "This device is not in our database :(",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ],
    );
  }
}