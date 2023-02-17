import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'network_exception.dart';

part 'api_response.freezed.dart';

@freezed
abstract class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse.success({required T data}) = Success<T>;
  const factory ApiResponse.failure({required String message}) = Failure<T>;
  const factory ApiResponse.error({required NetworkExceptions error}) =
      Error<T>;
}
