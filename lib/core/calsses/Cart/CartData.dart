import 'package:ecommerce_app/core/calsses/Requests.dart';
import 'package:ecommerce_app/core/constant/AppLinkes.dart';

class CartData extends Crud {
  addCart(String itemId, userId, itemPrice) async {
    var response = await postRequest(AppLink.addcart,
        {'item_id': itemId, 'user_id': userId, 'item_price': itemPrice});
    return response.fold((l) => l, (r) => r);
  }

  removeCart(String itemId, userId) async {
    var response = await postRequest(
        AppLink.removecart, {'item_id': itemId, 'user_id': userId});
    return response.fold((l) => l, (r) => r);
  }

  incrementCountCart(String cartId, String itemId, String itemPrice) async {
    var response = await postRequest(AppLink.incrementcount,
        {'cart_id': cartId, 'item_id': itemId, 'item_price': itemPrice});
    return response.fold((l) => l, (r) => r);
  }

  decrementCountCart(String cartId, String itemPrice) async {
    var response = await postRequest(
        AppLink.decrementcount, {'cart_id': cartId, 'item_price': itemPrice});
    return response.fold((l) => l, (r) => r);
  }

  setCountCartCustom(
      String cartId, String itemId, String itemPrice, String count) async {
    var response = await postRequest(AppLink.setCountCartCustom, {
      'cart_id': cartId,
      'item_id': itemId,
      'item_price': itemPrice,
      'count': count
    });
    return response.fold((l) => l, (r) => r);
  }

  getCoupon(String couponName) async {
    var response =
        await postRequest(AppLink.coupon, {'coupon_name': couponName});
    return response.fold((l) => l, (r) => r);
  }

  editCartCount(String count, String price, cartID) async {
    var response = await postRequest(AppLink.editCartCount,
        {'count': count, 'price': price, 'cart_id': cartID});
    return response.fold((l) => l, (r) => r);
  }
}
