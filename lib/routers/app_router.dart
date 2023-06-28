import 'package:auto_route/auto_route.dart';
import 'package:river_auth/page/auth/login_page.dart';
import 'package:river_auth/page/auth/signup_page.dart';
import 'package:river_auth/page/home_page.dart';
import 'package:river_auth/page/my_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: MyRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: SignupRoute.page),
  ];
}