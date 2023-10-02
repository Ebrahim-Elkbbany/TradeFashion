part of 'auth_cubit.dart';
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginLoadingState extends AuthState {}
class LoginSuccessState extends AuthState {
  LoginSuccessState(this.id);
  final int id;
}
class LoginErrorState extends AuthState {}

class RegisterLoadingState extends AuthState {}
class RegisterSuccessState extends AuthState {
  RegisterSuccessState(this.id);
   final int id;

}
class RegisterErrorState extends AuthState {}
class InsertCartLoadingState extends AuthState {}
class InsertCartSuccessState extends AuthState {
}
class GetUserSuccessState extends AuthState {}
class UpdateSuccessState extends AuthState {}
