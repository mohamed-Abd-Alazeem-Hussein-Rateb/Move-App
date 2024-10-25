part of 'get_cast_cubit.dart';

@immutable
sealed class GetCastState {}

final class GetCastInitial extends GetCastState {}

class GetCastLoading extends GetCastState {}

class GetCastSuccess extends GetCastState {   

  final List<CastModle> cast;
  GetCastSuccess(this.cast);
}

class GetCastError extends GetCastState {
  final String message;
  GetCastError(this.message);
}
