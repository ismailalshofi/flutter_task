class ResponseModel {
  String message;
  dynamic data;
  bool status;

  ResponseModel({
    required this.message,
    required this.data,
    required this.status,
  });

  factory ResponseModel.fromJson(data) {
    return ResponseModel(
      message: data['message'],
      data: data['data'],
      status: data['success'],
    );
  }
}
