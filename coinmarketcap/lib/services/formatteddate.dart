import 'package:intl/intl.dart';

class FormattedDate {
  static String getFormattedDate(DateTime datetime) {
    return new DateFormat("yyyy-MM-dd")
        .format(datetime)
        .toString()
        .substring(0, 10);
  }
}
