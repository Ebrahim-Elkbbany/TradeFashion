import 'package:go_router/go_router.dart';
import 'package:trade_fashion/features/auth/presentation/views/login_view.dart';
import 'package:trade_fashion/features/auth/presentation/views/register_view.dart';
import 'package:trade_fashion/features/auth/presentation/views/reset_password_view.dart';
import 'package:trade_fashion/features/auth/presentation/views/verify_email_view.dart';
import 'package:trade_fashion/features/profile/presentation/views/address_view.dart';
import 'package:trade_fashion/features/profile/presentation/views/payment_view.dart';
import 'package:trade_fashion/features/splash/presentation/views/splash_view.dart';

import '../../features/home/presentation/views/category_item_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/layout/layout.dart';
import '../../features/notification/presentation/views/category _view.dart';

class AppRouter {
  static const kLoginView = '/loginView';
  static const kRegisterView = '/registerView';
  static const kResetPassView = '/ResetPasswordView';
  static const kEmailVerifyCodeView = '/VerifyEmailView';
  static const kLayoutView = '/LayoutView';
  static const kHomeView = '/HomeView';
  static const kCategoryView = '/CategoryView';
  static const kCategoryItemView = '/CategoryItemView';
  static const kAddressView = '/AddressView';
  static const kPaymentView = '/PaymentViewView';
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
      GoRoute(
        path: kLayoutView,
        builder: (context, state) {
          return const LayoutView();
        },
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: kCategoryView,
        builder: (context, state) {
          return const CategoryView();
        },
      ),
      GoRoute(
        path: kCategoryItemView,
        builder: (context, state) {
          return const CategoryItemView();
        },
      ),
      GoRoute(
        path: kAddressView,
        builder: (context, state) {
          return const AddressView();
        },
      ),
      GoRoute(
        path: kPaymentView,
        builder: (context, state) {
          return const PaymentView();
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
