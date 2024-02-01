import 'package:ecommerce_app/core/bindings/MyBinding.dart';
import 'package:ecommerce_app/core/middleware/MyMiddlewere.dart';
import 'package:ecommerce_app/pages/Cart/CartView.dart';
import 'package:ecommerce_app/pages/EditProfile/EditProfileView.dart';
import 'package:ecommerce_app/pages/Favorite/FavoriteView.dart';
import 'package:ecommerce_app/pages/MoreCategories/CategoriesView.dart';
import 'package:ecommerce_app/pages/CategoryItems/CategoryItemsView.dart';
import 'package:ecommerce_app/pages/Home/HomeView.dart';
import 'package:ecommerce_app/pages/Item/ItemView.dart';
import 'package:ecommerce_app/pages/MoreItems/MoreItemsView.dart';
import 'package:ecommerce_app/pages/MorePages/MorePagesView.dart';
import 'package:ecommerce_app/pages/Offers/OffersView.dart';
import 'package:ecommerce_app/pages/OrderDetails/OrderDetailsView.dart';
import 'package:ecommerce_app/pages/OrdersAdd/OrdersAddView.dart';
import 'package:ecommerce_app/pages/TopSelling/TopSellingView.dart';
import 'package:ecommerce_app/pages/TrakingOrder/TrakingOrderView.dart';
import 'package:ecommerce_app/pages/address/AddressView.dart';
import 'package:ecommerce_app/pages/address/widgets/mapsWidget.dart';
import 'package:ecommerce_app/pages/addressAdd/AddressAddView.dart';
import 'package:ecommerce_app/pages/addressEdit/AddressEditView.dart';
import 'package:ecommerce_app/pages/auth/Login/login.dart';
import 'package:ecommerce_app/pages/auth/forgetpassword/forgetpassword/forgetpassword.dart';
import 'package:ecommerce_app/pages/auth/forgetpassword/resetpassword/resetpassword.dart';
import 'package:ecommerce_app/pages/auth/forgetpassword/success_resetpassword/success_resetpassword.dart';
import 'package:ecommerce_app/pages/auth/forgetpassword/verifycode/verifycode.dart';
import 'package:ecommerce_app/pages/auth/signup/signup.dart';
import 'package:ecommerce_app/pages/auth/success_signup/success_signup.dart';
import 'package:ecommerce_app/pages/auth/verifycodesignup/verifycodesignup.dart';
import 'package:ecommerce_app/pages/notification/notificationsView.dart';
import 'package:ecommerce_app/pages/orders/OrdersView.dart';
import 'package:ecommerce_app/pages/settings/settingsView.dart';
import 'package:get/get.dart';

import 'core/constant/AppRoute.dart';

List<GetPage<dynamic>> routes = [
  GetPage(
      name: '/',
      page: () => const Login(),
      binding: MyBinding(),
      middlewares: [MyMiddlewere()]),

  //Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),

  GetPage(name: AppRoute.home, page: () => const Home()),
  GetPage(name: AppRoute.item, page: () => const Item()),
  GetPage(name: AppRoute.categories, page: () => const Categories()),
  GetPage(name: AppRoute.categoryItems, page: () => const CategoryItems()),
  GetPage(name: AppRoute.moreItems, page: () => const MoreItems()),
  //Fvorite
  GetPage(name: AppRoute.favorite, page: () => const Favorite()),
  //Cart
  GetPage(name: AppRoute.cart, page: () => const Cart()),
  //Address
  GetPage(name: AppRoute.address, page: () => const AddressView()),
  GetPage(name: AppRoute.maps, page: () => const MapsView()),
  GetPage(name: AppRoute.addAddress, page: () => const AddressAddView()),
  GetPage(name: AppRoute.editAddress, page: () => const AddressEditView()),
  //Add Orders
  GetPage(name: AppRoute.addOrder, page: () => const AddOrders()),
  //Orders
  GetPage(name: AppRoute.orders, page: () => const Orders()),
  //MorePages
  GetPage(name: AppRoute.morePages, page: () => const MorePagesView()),

  //Settings
  GetPage(name: AppRoute.settings, page: () => const SettingsView()),
  //notifications
  GetPage(name: AppRoute.notifications, page: () => const NotificationsView()),
  //OrderDetailsView
  GetPage(
      name: AppRoute.orderDetailsView, page: () => const OrderDetailsView()),
  //offers
  GetPage(name: AppRoute.offers, page: () => const OffersView()),
  //TopSelling
  GetPage(name: AppRoute.topSelling, page: () => const TopSellingView()),
  //EditProfile
  GetPage(name: AppRoute.editprofile, page: () => const EditProfileView()),
//TrakingOrder
  GetPage(name: AppRoute.trakingOrder, page: () => const TrakingOrder()),
];
