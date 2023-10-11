class APIResponse {
  String message;
  dynamic data;
  int? status;

  APIResponse({required this.message, this.data, this.status});

  factory APIResponse.fromJson(Map<String, dynamic> json) {
    return APIResponse(
      message: json['message'] as String,
      data: json['data'],
      status: json['status'],
    );
  }
}