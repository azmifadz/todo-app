import 'package:intl/intl.dart';

DateFormat dateFilterDisplayDateFormat() => DateFormat('dd MMM yyyy');

String formattedDateOnly(DateTime date) {
  const format = 'yyyy-MM-dd';
  final dateFormatter = DateFormat(format);
  return dateFormatter.format(date);
}

DateTime? formattedDateTimeFromString(String? dateString) {
  if (dateString == null || dateString.isEmpty) {
    return null;
  }
  return DateTime.parse(dateString).toLocal();
}

String formattedDateStringFromString(String dateString) {
  final date = DateTime.parse(dateString).toLocal();
  return dateFilterDisplayDateFormat().format(date);
}

///Retrieve remaining duration from current time to End Date
String getTimeRemaining({
  required String inputStartDate,
  required String inputEndDate,
}) {
  final startDate = DateTime.parse(inputStartDate).toLocal();
  final endDate = DateTime.parse(inputEndDate).toLocal();
  final difference = endDate.difference(startDate);
  return _durationTransform(difference);
}

///Time conversion convert seconds to hours and minutes
String _durationTransform(Duration duration) {
  final parts = duration.toString().split(':');

  if (int.parse(parts[0]) >= 0) {
    return '${parts[0]}hrs ${parts[1]}min';
  } else {
    return '--';
  }
}
