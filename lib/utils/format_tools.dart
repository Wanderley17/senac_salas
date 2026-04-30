import 'package:intl/intl.dart';

class FormatTools {
  /// Função para converter DateTime para String
  String converterDateTime(DateTime dateTime){
    String dataFormatada = DateFormat('dd/MM/yyyy', 'pt_BR').format(dateTime);
    return dataFormatada;
  }
}