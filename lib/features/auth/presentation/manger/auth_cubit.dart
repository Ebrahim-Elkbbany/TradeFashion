import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_fashion/constants.dart';
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
        tokenEmail = email;
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
       tokenEmail = email;
      emit(RegisterSuccessState(5));
      showToast(message: 'تم تسجيل الدخول ناجح ',state: ToastStates.error)  ;

    }).catchError((error){
      emit(RegisterErrorState());
      showToast(message:error ,state: ToastStates.error)  ;


    });
  }



  Future<void> getCart()async{
    emit(GetCartLoadingState());
    final db = await DatabaseHelper().db;
    await db!.query(
      'cart',
      where: 'email = ?',
      whereArgs: [tokenEmail],
    ).then((value) =>
        emit(GetCartSuccessState(value))
    ).catchError((e){
      print(e);
      emit(GetCartErrorState(e.toString()));
    });
  }
  void insertCart({
    required String productName,
    required String price,
    required String image,
    required String color,
    required String size,
  })async{
    emit(InsertCartLoadingState());
    final db = await DatabaseHelper().db;
    await db?.insert('cart', {
      "productName": productName,
      "price": price,
      "email": tokenEmail,
      "image": image,
      "color": color,
      "size": size,
    }).then((value) {
      print(value);
      emit(InsertCartSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(InsertCartErrorState());
    });
  }





}
