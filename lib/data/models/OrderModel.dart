class OrderModel {
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
  String? orderRating;
  String? orderComment;
  String? orderDeliveryId;
  String? deliveryId;
  String? deliveryName;
  String? deliveryEmail;
  String? deliveryPassword;
  String? deliveryImage;
  String? deliveryApprove;
  String? deliveryVerfiycode;
  String? deliveryCreateTime;
  String? addressId;
  String? addressUserId;
  String? addressCity;
  String? addressStrees;
  String? addressLat;
  String? addressLng;

  OrderModel(
      {this.orderId,
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
      this.orderRating,
      this.orderComment,
      this.orderDeliveryId,
      this.deliveryId,
      this.deliveryName,
      this.deliveryEmail,
      this.deliveryPassword,
      this.deliveryImage,
      this.deliveryApprove,
      this.deliveryVerfiycode,
      this.deliveryCreateTime,
      this.addressId,
      this.addressUserId,
      this.addressCity,
      this.addressStrees,
      this.addressLat,
      this.addressLng});

  OrderModel.fromJson(Map<String, dynamic> json) {
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
    orderRating = json['order_rating'];
    orderComment = json['order_comment'];
    orderDeliveryId = json['order_delivery_id'];
    deliveryId = json['delivery_id'];
    deliveryName = json['delivery_name'];
    deliveryEmail = json['delivery_email'];
    deliveryPassword = json['delivery_password'];
    deliveryImage = json['delivery_image'];
    deliveryApprove = json['delivery_approve'];
    deliveryVerfiycode = json['delivery_verfiycode'];
    deliveryCreateTime = json['delivery_create_time'];
    addressId = json['address_id'];
    addressUserId = json['address_user_id'];
    addressCity = json['address_city'];
    addressStrees = json['address_strees'];
    addressLat = json['address_lat'];
    addressLng = json['address_lng'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
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
  //   data['order_rating'] = this.orderRating;
  //   data['order_comment'] = this.orderComment;
  //   data['order_delivery_id'] = this.orderDeliveryId;
  //   data['delivery_id'] = this.deliveryId;
  //   data['delivery_name'] = this.deliveryName;
  //   data['delivery_email'] = this.deliveryEmail;
  //   data['delivery_password'] = this.deliveryPassword;
  //   data['delivery_image'] = this.deliveryImage;
  //   data['delivery_approve'] = this.deliveryApprove;
  //   data['delivery_verfiycode'] = this.deliveryVerfiycode;
  //   data['delivery_create_time'] = this.deliveryCreateTime;
  //   data['address_id'] = this.addressId;
  //   data['address_user_id'] = this.addressUserId;
  //   data['address_city'] = this.addressCity;
  //   data['address_strees'] = this.addressStrees;
  //   data['address_lat'] = this.addressLat;
  //   data['address_lng'] = this.addressLng;
  //   return data;
  // }
}
