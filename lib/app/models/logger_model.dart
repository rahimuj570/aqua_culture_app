import 'package:logger/logger.dart';

class LoggerModel {
  final String url;
  final int statusCode;
  final dynamic body;

  LoggerModel({
    required this.url,
    required this.statusCode,
    required this.body,
  });

  final Logger _logger = Logger();

  void log({bool isError = false}) {
    if (isError) {
      _logger.e('URL=> $url \nStatus_Code=> $statusCode \nBody=> $body');
    } else {
      _logger.i('URL=> $url \nStatus_Code=> $statusCode \nBody=> $body');
    }
  }
}
