import 'package:intl/intl.dart';

class DateFormatter{

  //Converts string date in dd.MM.yyyy to MM/dd/yyyy format
  static String toServerFormat(String date){
    var clientDateFormat = DateFormat('dd.MM.yyyy');
    var serverDateFormat = DateFormat('MM/dd/yyyy');
    DateTime dateObject = clientDateFormat.parse(date).toLocal();
    var serverDateString = serverDateFormat.format(dateObject);
    return serverDateString;
  }

  //Converts string date in MM/dd/yyyy format to dd.MM.yyyy format
  static String toClientFormat(String date) {
    var clientDateFormat = DateFormat('dd.MM.yyyy');
    var serverDateFormat = DateFormat('MM/dd/yyyy');
    DateTime dateObject = serverDateFormat.parse(date).toLocal();
    var clientDateString = clientDateFormat.format(dateObject);
    return clientDateString;
  }
}