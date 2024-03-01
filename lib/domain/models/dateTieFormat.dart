import 'package:intl/intl.dart';

class DateTimeConverter{
  static DateTime parseDate(String dateString) {
    // Create a DateFormat object with the desired format
    DateFormat dateFormat = DateFormat('dd-MMM-yyyy');

    // Parse the string into a DateTime object
    DateTime dateTime = dateFormat.parse(dateString);

    return dateTime;
  }
}