import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CustomRomDeviceImage extends StatelessWidget{
  const CustomRomDeviceImage({
    Key? key,
    required this.extendedCodename
  }) : super(key: key);

  final String extendedCodename;

  @override
  Widget build(BuildContext context) {
    Future<http.Response> response = http.get(Uri.parse("https://customrombay.org/images/medium/$extendedCodename.webp"));
    return FutureBuilder<http.Response>(
      future: response,
      builder: (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
        if (snapshot.hasData) {
          http.Response response = snapshot.data!;
          if (response.statusCode == 200) {
            return Image.network(
              "https://customrombay.org/images/medium/$extendedCodename.webp",
              height: 300,
            );
          }
          else {
            return const Image(
              image: AssetImage('assets/phone.png'),
              height: 300,
            );
          }
        }
        else if (snapshot.hasError) {
          return const Image(
            image: AssetImage('assets/phone.png'),
            height: 300,
          );
        }
        return const SizedBox(
          width: 300,
          height: 300,
          child: CircularProgressIndicator(),
        );
      }
    );
  }
}