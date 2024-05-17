import 'package:intl/intl.dart';

extension DateExtension on String {
  formatDate() {
    DateTime parseDate = DateFormat("yyyy-MMM-dd").parse(this);
    return parseDate.toString();
  }
}
