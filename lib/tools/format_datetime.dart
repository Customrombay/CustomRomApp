String formatDateTime(DateTime dateTime) {
  int day = dateTime.day;
  int month = dateTime.month;
  int year = dateTime.year;
  List<String> listOfMonths = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
  String monthString = listOfMonths[month - 1];
  return "$monthString $day, $year";
}