import 'package:go_router/go_router.dart';
import 'package:trade_fashion/features/auth/presentation/views/login_view.dart';
import 'package:trade_fashion/features/auth/presentation/views/register_view.dart';
import 'package:trade_fashion/features/auth/presentation/views/reset_password_view.dart';
import 'package:trade_fashion/features/auth/presentation/views/verify_email_view.dart';
import 'package:trade_fashion/features/splash/presentation/views/splash_view.dart';

class AppRouter {
  static const kLoginView = '/loginView';
  static const kRegisterView = '/registerView';
  static const kResetPassView = '/ResetPasswordView';
  static const kEmailVerifyCodeView = '/VerifyEmailView';
  static const kHomeViewPath = '/homeView';
  static const kBookDetailsViewPath = '/bookDetailsView';
  static const kSearchViewBodyPath = '/searchViewBody';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) {
          return const LoginView();
        },
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) {
          return const RegisterView();
        },
      ),
      GoRoute(
        path: kResetPassView,
        builder: (context, state) {
          return const ResetPasswordView();
        },
      ),
      GoRoute(
        path: kEmailVerifyCodeView,
        builder: (context, state) {
          return const VerifyEmailView();
        },
      ),
      // GoRoute(
      //   path: kSearchViewBodyPath,
      //   builder: (context, state) {
      //     return BlocProvider(
      //       create: (context) => SearchCubit(
      //         getIt.get<SearchRepoImpl>(),
      //       ),
      //       child: const SearchView(),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: kHomeViewPath,
      //   builder: (context, state) => const HomeView(),
      // ),
      // GoRoute(
      //   path: kBookDetailsViewPath,
      //   builder: (context, state) {
      //     return BlocProvider(
      //       create: (context) => RelevanceBooksCubit(
      //         getIt.get<HomeRepoImpl>(),
      //       ),
      //       child: BookDetailsView(bookModel: state.extra as BookModel ),
      //     );
      //   },
      // ),
    ],
  );
}
