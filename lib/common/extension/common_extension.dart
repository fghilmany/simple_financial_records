import 'package:intl/intl.dart';


extension IntegerParsing on int{
  String parseTimeMillisToDate(String format){
    var dt = DateTime.fromMillisecondsSinceEpoch(this);
    var date = DateFormat(format).format(dt);
    return date;
  }
}