import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_fashion/features/home/data/models/product_model.dart';
import '../../../../core/widgets/toast.dart';
import '../../data/model.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) {
    return BlocProvider.of(context);
  }

  Future<List<Map<String, dynamic>>> getUsersByEmail(String email) async {
    final db = await DatabaseHelper().db;
    return await db!.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );
  }

  String ? email;
  Future<void> login({
    required final String email,
    required final String password,
  }) async {
    emit(LoginLoadingState());
    final users = await getUsersByEmail(email);
    if (users.isNotEmpty) {
      final user = users.first;
      final storedPassword =
          user['password']; // استخراج كلمة المرور المخزنة في الجدول

      if (password == storedPassword) {
        // تسجيل الدخول ناجح
        emit(LoginSuccessState(5));
        showToast(message: ' تسجيل الدخول ناجح',state: ToastStates.error)  ;

      } else {
        // كلمة المرور غير صحيحة
        emit(LoginErrorState());
        showToast(message: ' كلمة المرور غير صحيحة',state: ToastStates.error)  ;

      }
    } else {
      // المستخدم غير موجود
      showToast(message: 'المستخدم غير موجود',state: ToastStates.error)  ;
      print('المستخدم غير موجود');
      emit(LoginErrorState());
    }
  }

  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    emit(RegisterLoadingState());
    final existingUsers = await getUsersByEmail(email);
    if (existingUsers.isNotEmpty) {
      showToast(message: 'هذا البريد الإلكتروني مستخدم بالفعل',state: ToastStates.error)  ;
      throw Exception('هذا البريد الإلكتروني مستخدم بالفعل');
    }

     await DatabaseHelper().addUser(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName).then((value){
      emit(RegisterSuccessState(5));
      showToast(message: 'تم تسجيل الدخول ناجح ',state: ToastStates.error)  ;

    }).catchError((error){
      emit(RegisterErrorState());
      showToast(message:error ,state: ToastStates.error)  ;


    });
  }



 List<Map<String, Object?>> cartList ;

  Future<List<Map<String, Object?>>> getCart({required String email})async{
    final db = await DatabaseHelper().db;
    Future<List<Map<String, Object?>>> cartData=db!.query(
      'cart',
      where: 'email = ?',
      whereArgs: [email],
    ).then((value) =>
        cartList = value
    );
    return cartData;
  }
  Future<List<Map<String, Object?>>> insertCart({required String email})async{
    final db = await DatabaseHelper().db;

  }





}
