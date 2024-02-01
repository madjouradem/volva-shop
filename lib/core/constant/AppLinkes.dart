// ignore_for_file: file_names

class AppLink {
  // static const String serverLink = 'http://10.0.2.2/ecommerce/';
  static const String serverLink = 'http://192.168.1.4/ecommerce/';
  static const String upload = '${serverLink}upload/';
  static const String api = '${serverLink}api/';

//auth
  static const String login = '${api}Auth/LogIn.php';
  static const String logins = '${serverLink}Auth/LogIn.php';
  static const String signup = '${api}Auth/SignUp.php';
  static const String verifycodessignup = '${api}Auth/VerfiyCode.php';
  static const String checkEmail = '${api}Auth/ForgetPassword/CheckEmail.php';
  static const String resetPassword =
      '${api}Auth/ForgetPassword/ResetPassword.php';
  static const String verifycodeforgetpassword =
      '${api}Auth/ForgetPassword/VerfiyCode.php';
//Home
  static const String getHomeData = '${api}home/getHomeData.php';

//CategoryItem
  static const String getCategoryItemandSubCategories =
      '${api}CategoryItem/getCategoryItemAndSubCategories.php';

//MoreItem
  static const String moreItem = '${api}moreItems/moreItems.php';

//Favorite
  static const String favorite = '${api}favorite/favorite.php';
  static const String removefavorite = '${api}favorite/removeFavorite.php';
  static const String addfavorite = '${api}favorite/addFavorite.php';

//Cart
  static const String cart = '${api}cart/cart.php';
  static const String removecart = '${api}cart/removeCart.php';
  static const String addcart = '${api}cart/addCart.php';
  static const String incrementcount = '${api}cart/incrementCount.php';
  static const String decrementcount = '${api}cart/decrementCount.php';
  static const String setCountCartCustom = '${api}cart/setCartCountCustom.php';
  static const String coupon = '${api}coupon/applayCoupon.php';
  static const String editCartCount = '${api}cart/editCartCount.php';

  //Address
  static const String address = '${api}address/viewAddress.php';
  static const String removeaddress = '${api}address/removeAddress.php';
  static const String addaddress = '${api}address/addAddress.php';
  static const String editaddress = '${api}address/editAddress.php';

//checkOut "add order"
  static const String checkout = '${api}checkout/checkout.php';
  //order
  static const String orders = '${api}orders/orders.php';
  static const String removeOrder = '${api}orders/removeOrder.php';
  static const String ratingOrder = '${api}orders/ratingOrder.php';

  //notification
  static const String notifications = '${api}notifications/notification.php';

  //ordersDetails
  static const String ordersDetails = '${api}ordersDetails/ordersDetails.php';

  //offers
  static const String offers = '${api}Offers/Offers.php';
  //topSelling
  static const String topSelling = '${api}topSelling/topSelling.php';
  //editProfile
  static const String changeUsername = '${api}editProfile/changeUsername.php';
  static const String changePassword = '${api}editProfile/changePassword.php';
  static const String changeImage = '${api}editProfile/changeImage.php';
  //seach
  static const String searchWithName = '${api}search/searchWithName.php';
}
