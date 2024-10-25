import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class Falieur {
  final String message;
  Falieur( this.message);
}

class ServerError extends Falieur {
   ServerError({required String message}) : super(message);
  factory ServerError.fromDioError(DioException dioError) {
    switch (dioError.type) {
 
      case DioExceptionType.connectionTimeout:
        return ServerError(
          message:const Text('Connection timeout with ApiServer', style: TextStyle(color: Colors.white)).toString(),
        );
      case DioExceptionType.sendTimeout:
        return ServerError(
          message:const Text('Send timeout with ApiServer', style: TextStyle(color: Colors.white)).toString(), 
        );
      case DioExceptionType.receiveTimeout:
        return ServerError(
          message:const Text('Receive timeout with ApiServer', style: TextStyle(color: Colors.white)).toString(),
        );
      case DioExceptionType.badCertificate:
        return ServerError(
          message: 'Bad certificate with ApiServer',
        );
      case DioExceptionType.badResponse:
        return ServerError(
          message: 'Bad response with ApiServer',
        );
      case DioExceptionType.cancel:
        return ServerError(
          message: 'Request to ApiServer was cancelled',
        );
      case DioExceptionType.connectionError:
        return ServerError(
          message: Text('Connection error with ApiServer', style: TextStyle(color: Colors.white)).toString(),
        );
      case DioExceptionType.unknown:
        return ServerError(
          message: 'Unknown error with ApiServer',
        );
      default:
        return ServerError(
          message: 'Something went wrong with ApiServer',
        );
    }
}
  }