import '/views/signup_screen.dart';
import 'package:get/get.dart';
import './route_name.dart';
import '../views/home_screen.dart';
import '../views/login_screen.dart';

class Pages {
  static final pages = [
    GetPage(name: RoutesName.home, page: (() => HomePage())),
    GetPage(name: RoutesName.login, page: (() => LoginPage())),
    GetPage(name: RoutesName.signUp, page: (() => SignUpPage())),
  ];
}
