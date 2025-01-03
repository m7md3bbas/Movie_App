import 'package:get/get.dart';
import 'package:movieapp/presentation/Auth/manager/binding/auth_binding.dart';
import 'package:movieapp/presentation/Auth/screens/forgetPassword.dart';
import 'package:movieapp/presentation/Auth/screens/login.dart';
import 'package:movieapp/presentation/Auth/screens/reigster.dart';
import 'package:movieapp/presentation/Home/manager/binding/home_bindings.dart';
import 'package:movieapp/presentation/MainPage/main_page.dart';
import 'package:movieapp/presentation/Search/manager/binding/search_binding.dart';
import 'package:movieapp/presentation/moviedetails/manager/bindings/moviedetails.dart';

class MyRoutes {
  static List<GetPage<dynamic>> get myroutes {
    return [
      GetPage(name: '/login', page: () => Login(), binding: AuthBinding()),
      GetPage(
          name: '/register', page: () => Register(), binding: AuthBinding()),
      GetPage(
          name: '/forgetPassword',
          page: () => ForgetPasswordPage(),
          binding: AuthBinding()),
      GetPage(
        name: '/mainpage',
        page: () => MainPageView(),
        bindings: [
          HomeBindings(),
          SearchBinding(),
          AuthBinding(),
          Moviedetails()
        ],
        transition: Transition.cupertino,
      ),
    ];
  }
}
