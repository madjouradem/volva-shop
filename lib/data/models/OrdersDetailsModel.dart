class OrdersDetailsModel {
  String? cartId;
  String? cartUserId;
  String? cartItemId;
  String? cartCount;
  String? cartPrice;
  String? cartOrderId;
  String? orderId;
  String? orderUserId;
  String? orderAddress;
  String? orderType;
  String? orderPriceDelivery;
  String? orderPrice;
  String? orderCoupon;
  String? orderDate;
  String? orderDeliveryType;
  String? orderPayType;
  String? orderStatus;
  String? itemId;
  String? itemCatId;
  String? itemSubcatId;
  String? itemName;
  String? itemNameAr;
  String? itemDesc;
  String? itemDescAr;
  String? itemImage;
  String? ititemCount;
  String? itemActive;
  String? itemPrice;
  String? itemDiscount;
  String? itemCreateTime;
  String? addressId;
  String? addressUserId;
  String? addressCity;
  String? addressStrees;
  String? addressLat;
  String? addressLng;
  String? couponId;
  String? couponName;
  String? couponCount;
  String? couponDicount;
  String? couponExpired;

  OrdersDetailsModel(
      {this.cartId,
      this.cartUserId,
      this.cartItemId,
      this.cartCount,
      this.cartPrice,
      this.cartOrderId,
      this.orderId,
      this.orderUserId,
      this.orderAddress,
      this.orderType,
      this.orderPriceDelivery,
      this.orderPrice,
      this.orderCoupon,
      this.orderDate,
      this.orderDeliveryType,
      this.orderPayType,
      this.orderStatus,
      this.itemId,
      this.itemCatId,
      this.itemSubcatId,
      this.itemName,
      this.itemNameAr,
      this.itemDesc,
      this.itemDescAr,
      this.itemImage,
      this.ititemCount,
      this.itemActive,
      this.itemPrice,
      this.itemDiscount,
      this.itemCreateTime,
      this.addressId,
      this.addressUserId,
      this.addressCity,
      this.addressStrees,
      this.addressLat,
      this.addressLng,
      this.couponId,
      this.couponName,
      this.couponCount,
      this.couponDicount,
      this.couponExpired});

  OrdersDetailsModel.fromJson(Map<String, dynamic> json) {
    cartId = json['cart_id'];
    cartUserId = json['cart_user_id'];
    cartItemId = json['cart_item_id'];
    cartCount = json['cart_count'];
    cartPrice = json['cart_price'];
    cartOrderId = json['cart_order_id'];
    orderId = json['order_id'];
    orderUserId = json['order_user_id'];
    orderAddress = json['order_address'];
    orderType = json['order_type'];
    orderPriceDelivery = json['order_price_delivery'];
    orderPrice = json['order_price'];
    orderCoupon = json['order_coupon'];
    orderDate = json['order_date'];
    orderDeliveryType = json['order_delivery_type'];
    orderPayType = json['order_pay_type'];
    orderStatus = json['order_status'];
    itemId = json['item_id'];
    itemCatId = json['item_cat_id'];
    itemSubcatId = json['item_subcat_id'];
    itemName = json['item_name'];
    itemNameAr = json['item_name_ar'];
    itemDesc = json['item_desc'];
    itemDescAr = json['item_desc_ar'];
    itemImage = json['item_image'];
    ititemCount = json['ititem_count'];
    itemActive = json['item_active'];
    itemPrice = json['item_price'];
    itemDiscount = json['item_discount'];
    itemCreateTime = json['item_create_time'];
    addressId = json['address_id'];
    addressUserId = json['address_user_id'];
    addressCity = json['address_city'];
    addressStrees = json['address_strees'];
    addressLat = json['address_lat'];
    addressLng = json['address_lng'];
    couponId = json['coupon_id'];
    couponName = json['coupon_name'];
    couponCount = json['coupon_count'];
    couponDicount = json['coupon_dicount'];
    couponExpired = json['coupon_expired'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['cart_id'] = this.cartId;
  //   data['cart_user_id'] = this.cartUserId;
  //   data['cart_item_id'] = this.cartItemId;
  //   data['cart_count'] = this.cartCount;
  //   data['cart_price'] = this.cartPrice;
  //   data['cart_order_id'] = this.cartOrderId;
  //   data['order_id'] = this.orderId;
  //   data['order_user_id'] = this.orderUserId;
  //   data['order_address'] = this.orderAddress;
  //   data['order_type'] = this.orderType;
  //   data['order_price_delivery'] = this.orderPriceDelivery;
  //   data['order_price'] = this.orderPrice;
  //   data['order_coupon'] = this.orderCoupon;
  //   data['order_date'] = this.orderDate;
  //   data['order_delivery_type'] = this.orderDeliveryType;
  //   data['order_pay_type'] = this.orderPayType;
  //   data['order_status'] = this.orderStatus;
  //   data['item_id'] = this.itemId;
  //   data['item_cat_id'] = this.itemCatId;
  //   data['item_subcat_id'] = this.itemSubcatId;
  //   data['item_name'] = this.itemName;
  //   data['item_name_ar'] = this.itemNameAr;
  //   data['item_desc'] = this.itemDesc;
  //   data['item_desc_ar'] = this.itemDescAr;
  //   data['item_image'] = this.itemImage;
  //   data['ititem_count'] = this.ititemCount;
  //   data['item_active'] = this.itemActive;
  //   data['item_price'] = this.itemPrice;
  //   data['item_discount'] = this.itemDiscount;
  //   data['item_create_time'] = this.itemCreateTime;
  //   data['address_id'] = this.addressId;
  //   data['address_user_id'] = this.addressUserId;
  //   data['address_city'] = this.addressCity;
  //   data['address_strees'] = this.addressStrees;
  //   data['address_lat'] = this.addressLat;
  //   data['address_lng'] = this.addressLng;
  //   data['coupon_id'] = this.couponId;
  //   data['coupon_name'] = this.couponName;
  //   data['coupon_count'] = this.couponCount;
  //   data['coupon_dicount'] = this.couponDicount;
  //   data['coupon_expired'] = this.couponExpired;
  //   return data;
  // }
}
