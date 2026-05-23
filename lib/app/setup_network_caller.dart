import 'package:aqua_culture_app/app/services/network_caller_service.dart';

NetworkCallerService getNetworkCaller({Map<String, String>? extraHeaders}) {
  return NetworkCallerService(headers: extraHeaders);
}
