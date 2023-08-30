import 'package:go_router/go_router.dart';
import 'package:trade_fashion/features/auth/presentation/views/login_view.dart';
import 'package:trade_fashion/features/splash/presentation/views/splash_view.dart';

class AppRouter {
  static const kLoginView = '/loginView';
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
