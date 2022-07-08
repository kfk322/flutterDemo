import 'package:flutter/material.dart';

import '../pages/Search.dart';
import '../pages/FormData.dart';
import '../pages/Tabs.dart';
import '../pages/Product.dart';
import '../pages/ProductInfo.dart';
import '../pages/user/Login.dart';
import '../pages/user/Register.dart';
import '../pages/user/Register2.dart';
import '../pages/user/Register3.dart';
import '../pages/user/UserPage.dart';
import '../pages/AppBarDemo.dart';
import '../pages/TabControllerDemo.dart';
import '../pages/ButtonPage.dart';
import '../pages/DateFormatPage.dart';
import '../pages/SwiperDemo.dart';
import '../pages/RequestResponse.dart';
import '../pages/FirebaseTesting.dart';
import '../pages/user/VerifiyEmailPage.dart';
import '../pages/notes/Notes.dart';
import '../pages/notes/create_update_note_view.dart';
import '../pages/CounterApp.dart';

const tabPage = '/tabs';
const formDataPage = '/form';
const searchPage = '/search';
const productPage = '/product';
const productInfoPage = '/productInfo';
const loginPage = '/login';
const registerPage = '/register';
const register2Page = '/register2';
const register3Page = '/register3';
const appBarDemoPage = '/appbardemo';
const tabControllerDemoPage = '/tabControllerDemo';
const userPage = '/user';
const buttonPage = '/button';
const dateFormatPage = '/dateFormat';
const swiperPage = '/swiper';
const rrPage = '/rr';
const firePage = '/fire';
const vepPage = '/vep';
const notePage = '/note';
const createOrUpdateNotePage = '/createOrUpdate';
const counterApp1Page = '/counterApp';

final Map<String, Widget Function(BuildContext context)> routes = {
  tabPage: (context) => const Tabs(),
  formDataPage: (context) => const FormDataPage(title: "New Form"),
  searchPage: (context, {arguments}) => SearchPage(arguments: arguments),
  productPage: (context) => const ProductPage(),
  productInfoPage: (context, {arguments}) =>
      ProductInfoPage(arguments: arguments),
  loginPage: (context) => const LoginPage(),
  registerPage: (context) => const RegisterPage(),
  register2Page: (context) => const Register2Page(),
  register3Page: (context) => const Register3Page(),
  appBarDemoPage: (context) => const AppBarDemoPage(),
  tabControllerDemoPage: (context) => const TabControllerDemo(),
  userPage: (context) => const UserPage(),
  buttonPage: (context) => const ButtonPage(),
  dateFormatPage: (context) => const DateFormatPage(),
  swiperPage: (context) => SwiperPage(),
  rrPage: (context) => const RRPage(),
  firePage: (context) => const FirebaseTestingPage(),
  vepPage: (context) => const VerifyEmailPage(),
  notePage: (context) => const NoteView(),
  createOrUpdateNotePage: (context) => const CreateUpdateNoteView(),
  counterApp1Page: (context) => const CounterAppPage(),
};

// var onGenerateRoute = (RouteSettings settings) {
//   final String? name = settings.name;
//   final Function? pageContentBuilder = routes[name];
//   if (pageContentBuilder != null) {
//     if (settings.arguments != null) {
//       final Route route = MaterialPageRoute(
//           builder: (context) =>
//               pageContentBuilder(context, arguments: settings.arguments));
//       return route;
//     } else {
//       final Route route =
//           MaterialPageRoute(builder: (context) => pageContentBuilder(context));
//       return route;
//     }
//   }
// };
