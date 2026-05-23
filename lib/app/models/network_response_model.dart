class NetworkResponseModel {
  final bool isSuccess;
  final int statusCode;
  final dynamic responseData;

  NetworkResponseModel({
    required this.isSuccess,
    required this.statusCode,
    required this.responseData,
  });
}
