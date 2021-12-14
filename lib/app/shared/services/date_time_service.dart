import 'package:intl/intl.dart';

class DateTimeService {
  String getSmallDate(DateTime date) {
    return DateFormat('yy-MM-dd').format(date);
  }
}
