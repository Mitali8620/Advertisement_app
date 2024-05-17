import 'package:intl/intl.dart';

class AppCommonFunctions {
  String formatDate({required String inputDate}) {
    final inputFormat = 'dd/MMM/yyyy HH:mm:ss';

    /// Input date format
    final outputFormat = 'dd-MMM-yyyy';

    /// Output date format

    try {
      /// Parse the input date string to DateTime
      DateTime parsedDate = DateFormat(inputFormat).parse(inputDate);

      String formattedDate = DateFormat(outputFormat).format(parsedDate);
      return formattedDate;

      /// Return the formatted date as a string
    } catch (e) {
      return formatCurrentDate();
    }
  }

  String formatCurrentDate() {
    final outputFormat = 'dd-MMM-yyyy';
    print("outputFormat. :: ${outputFormat.runtimeType}");
    String formattedDate = DateFormat(outputFormat).format(DateTime.now());
    return formattedDate;
  }
}
