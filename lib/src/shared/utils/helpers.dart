import 'package:intl/intl.dart';

class Helpers {
  int? extractNumberFromString(String input) {
    final regex = RegExp(r'\d+');
    final match = regex.firstMatch(input);

    if (match != null) {
      return int.parse(match.group(0)!);
    }
    return null;
  }

  String extractAllDigits(String input) {
    return input.replaceAll(RegExp(r'[^0-9]'), '');
  }

  List<int> extractAllNumbers(String input) {
    final regex = RegExp(r'\d+');
    return regex.allMatches(input).map((match) => int.parse(match.group(0)!)).toList();
  }

  String formatDateTime(String isoDate) {
    DateTime utcDateTime = DateTime.parse(isoDate);

    DateTime localDateTime = utcDateTime.toLocal();

    final DateFormat formatter = DateFormat('hh:mm:ss a');

    return formatter.format(localDateTime);
  }


  String formatTimestampToDate(int timestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

    final DateFormat formatter = DateFormat('MMMM d, yyyy', 'en_US');

    return formatter.format(dateTime);
  }
}
