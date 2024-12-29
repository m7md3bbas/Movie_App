import 'package:get/get.dart';
import 'package:movieapp/features/auth/presentation/manager/binding/auth_binding.dart';
import 'package:movieapp/features/auth/presentation/screens/forgetPassword.dart';
import 'package:movieapp/features/auth/presentation/screens/login.dart';
import 'package:movieapp/features/auth/presentation/screens/reigster.dart';
import 'package:movieapp/features/home/presentation/manager/binding/home_bindings.dart';
import 'package:movieapp/features/home/presentation/screens/home.dart';
import 'package:movieapp/features/search/presentation/manager/binding/search_binding.dart';
import 'package:movieapp/features/search/presentation/screens/search.dart';

class MyRoutes {
  static List<GetPage<dynamic>> get myroutes {
    return [
      GetPage(
          name: '/login', page: () => const Login(), binding: AuthBinding()),
      GetPage(
          name: '/register',
          page: () => const Register(),
          binding: AuthBinding()),
      GetPage(
          name: '/forgetPassword',
          page: () => ForgetPasswordPage(),
          binding: AuthBinding()),
      GetPage(
          name: '/search',
          page: () => Search(),
          binding: SearchBinding(),
          transition: Transition.cupertino),
      GetPage(
          name: '/home',
          page: () => Home(),
          binding: HomeBindings(),
         ),
    ];
  }
}
