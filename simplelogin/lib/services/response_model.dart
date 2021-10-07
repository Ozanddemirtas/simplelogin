import 'package:testproject/utils/page_exporter.dart';

class ResponseModel {
  List<String> validationErrors;
  bool hasError;
  String? message;
  dynamic data;
  ResponseModel({
    this.validationErrors = const [],
    required this.hasError,
    this.message,
    required this.data,
  });

  factory ResponseModel.fromMap(Map<String, dynamic> map) {
    return ResponseModel(
      validationErrors: List<String>.from(map['ValidationErrors']),
      hasError: map['HasError'],
      message: map['Message'],
      data: map['Data'],
    );
  }

  factory ResponseModel.fromJson(String source) =>
      ResponseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ResponseModel(validationErrors: $validationErrors, hasError: $hasError, message: $message, data: $data)';
  }
}
