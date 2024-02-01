import '../../core/constant/AppImage.dart';
import '../../core/constant/AppRoute.dart';
import '../models/BNBModel.dart';

List<BNBModel> bnblist = [
  BNBModel(
    name: 'Home',
    icon: AppImage.home,
    route: AppRoute.home,
    defaultNum: 0,
  ),
  BNBModel(
    name: 'Cart',
    icon: AppImage.cart,
    route: AppRoute.cart,
    defaultNum: 1,
  ),
  BNBModel(
      name: 'Favorite',
      icon: AppImage.favorite,
      route: AppRoute.favorite,
      defaultNum: 2),
  BNBModel(
      name: 'Notification',
      icon: AppImage.notification,
      route: AppRoute.notifications,
      defaultNum: 3),
  BNBModel(
      name: 'account',
      icon: AppImage.settings,
      route: AppRoute.morePages,
      defaultNum: 4),
];



// List images = [
//   'image1.jpg',
//   'image2.jpg',
//   'image3.jpg',
//   'image4.jpg',
//   'image5.jpg',
// ];
