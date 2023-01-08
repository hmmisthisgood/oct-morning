part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final String errorMessage;

  AuthError({required this.errorMessage});
}

class AuthSuccess extends AuthState {
  final user;
  AuthSuccess({this.user});
}
