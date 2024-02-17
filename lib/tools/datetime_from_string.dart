DateTime dateTimeFromString(String string){
  List<String> listOfStrings = string.split(".");
  List<int> listOfInts = listOfStrings.map((e) => int.parse(e)).toList();
  return DateTime(listOfInts[2], listOfInts[1], listOfInts[0]);
}