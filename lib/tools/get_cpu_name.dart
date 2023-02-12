import 'dart:io';

String getCpuName() {
  String content = File("/proc/cpuinfo").readAsStringSync();
  List<String> contentList = content.split("\n");
  for (String element in contentList) {
    element = element.trim();
    List<String> elementList = element.split(":");
    if (elementList.first.trim() == "Hardware") {
      return elementList[1].trim();
    }
  }
  return "";
}