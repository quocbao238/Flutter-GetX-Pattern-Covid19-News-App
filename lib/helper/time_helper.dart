import 'package:intl/intl.dart';

class TimeHelper {
  TimeHelper._();
  static String convertTimeLastUpdate(String dataTime) =>
      DateFormat('hh:mm dd-MM-yyyy')
          .format(DateTime.parse(dataTime).add(new Duration(hours: 7)));
}
