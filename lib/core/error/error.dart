import 'package:dio/dio.dart';

abstract class Error {
  const Error(this.error);

  final String error;
}

class ServiceError extends Error {
  const ServiceError(super.error);

  factory ServiceError.fromDio(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
        return const ServiceError('Connect timeout.');
      case DioErrorType.sendTimeout:
        return const ServiceError('send timeout.');
      case DioErrorType.receiveTimeout:
        return const ServiceError('Receive timeout.');
      case DioErrorType.response:
        return ServiceError.fromResponse(
          dioError.response!.statusCode!,
          dioError.response!.statusMessage,
        );
      case DioErrorType.cancel:
        return const ServiceError('Request canceled.');
      case DioErrorType.other:
        if (dioError.message.contains('SocketException')) {
          return const ServiceError('Check Internet.');
        }
        return const ServiceError('an other error.');
    }
  }

  factory ServiceError.fromResponse(code, data) {
    if (code == '400' || code == '401' || code == '403') {
      return ServiceError(data["status_message"]);
    } else if (code == '404') {
      return ServiceError(data['status_message']);
    } else if (code == '500') {
      return const ServiceError('Internet Server Error.');
    }
    return const ServiceError('error was found in response.');
  }
}
