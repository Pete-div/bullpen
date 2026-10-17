class ServerResponse {
  final Object? data;
  final String msg;
  final bool success;
  final int? code;

  ServerResponse({
    required this.data,
    required this.success,
    required this.msg,
    this.code,
  });

  factory ServerResponse.fromJson(Map<String, dynamic> json) {
    final status = json['status']?.toString().trim().toLowerCase();

    final successKeywords = ['success', 'aṣeyọri', 'éxito', 'succès'];

    final isSuccess =
        json['success'] == true ||
        (status != null && successKeywords.any((kw) => status.contains(kw)));

    return ServerResponse(
      data: json.containsKey('data') ? json['data'] : null,
      success: isSuccess,
      msg: json['msg']?.toString() ?? json['message']?.toString() ?? '',
      code: json['code'] is int ? json['code'] : null,
    );
  }
}

class VerificationResponse {
  final String status;
  final String message;
  final dynamic data;

  VerificationResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory VerificationResponse.fromJson(Map<String, dynamic> json) {
    return VerificationResponse(
      status: json['status']?.toString() ?? '',
      message: json['message']?.toString() ?? '',
      data: json['data'],
    );
  }

  bool get isSuccess => status.toLowerCase() == 'success';
}

class ServerDataArrayResponse {
  final List data;
  final String msg;
  final bool success;
  final int? code;

  ServerDataArrayResponse({
    required this.data,
    required this.success,
    required this.msg,
    this.code,
  });

  factory ServerDataArrayResponse.fromJson(Map<String, dynamic> json) {
    final rawData = json['data'];

    return ServerDataArrayResponse(
      data: rawData is List ? rawData : [],
      success: json['success'] == true || json['status'] == 'success',
      msg: json['msg']?.toString() ?? json['message']?.toString() ?? '',
      code: json['code'] is int ? json['code'] : null,
    );
  }
}
