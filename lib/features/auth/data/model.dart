import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'my_database.db');
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY,
        firstName TEXT,
        lastName TEXT,
        email TEXT,
        password TEXT
      )
    ''');
  }

  Future<void> addUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final db = await DatabaseHelper().db;
    await db!.insert(
      'users',
      {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

}

// class PasswordResetHelper {
//   final Database db;
//
//   PasswordResetHelper(this.db);
//
//   Future<void> resetPassword(String email) async {
//     try {
//       // خطوة 1: التحقق من وجود البريد الإلكتروني في قاعدة البيانات
//       final user = await db.query('users', where: 'email = ?', whereArgs: [email]);
//
//       if (user.isEmpty) {
//         throw Exception('البريد الإلكتروني غير موجود في قاعدة البيانات');
//       }
//
//       // خطوة 2: إنشاء رمز مؤقت (Token)
//       final token = generateRandomToken(); // يجب تنفيذ هذه الدالة لإنشاء الرمز المؤقت.
//
//       // خطوة 3: تخزين الرمز المؤقت مع البريد الإلكتروني
//       await db.insert(
//         'password_reset_tokens',
//         {'email': email, 'token': token, 'expiration_date': calculateExpirationDate()},
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//
//       // خطوة 4: إرسال الرمز المؤقت إلى المستخدم (هنا يمكنك تنفيذ الإرسال عبر البريد الإلكتروني أو غيره)
//       sendPasswordResetEmail(email, token); // يجب تنفيذ هذه الدالة لإرسال البريد الإلكتروني.
//     } catch (e) {
//       // معالجة الأخطاء هنا
//       print('حدث خطأ أثناء إعادة تعيين كلمة المرور: $e');
//       throw Exception('حدث خطأ أثناء إعادة تعيين كلمة المرور');
//     }
//   }
//
//   // يمكنك تنفيذ الدوال التي تقوم بإنشاء الرمز المؤقت وحساب تاريخ الانتهاء هنا.
//   String generateRandomToken() {
//     // قم بتنفيذ رمز عشوائي هنا وقم بإعادته.
//   }
//
//   DateTime calculateExpirationDate() {
//     // قم بحساب تاريخ انتهاء الصلاحية هنا وقم بإعادته.
//   }
//
//   // يمكنك تنفيذ الدالة التي تقوم بإرسال البريد الإلكتروني هنا.
//   void sendPasswordResetEmail(String email, String token) {
//     // قم بتنفيذ إرسال البريد الإلكتروني هنا.
//   }
// }