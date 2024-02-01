class CartModel {
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
  double? itemPriceDiscount;
  String? itemCreateTime;
  String? catId;
  String? catName;
  String? catNameAr;
  String? catImage;
  String? catCreateTime;
  String? cartId;
  String? cartUserId;
  String? cartItemId;
  String? cartCount;
  String? cartPrice;
  String? isCart;
  double? itemPriceDiscountWithCount;

  CartModel(
      {this.itemId,
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
      this.itemPriceDiscount,
      this.itemCreateTime,
      this.catId,
      this.catName,
      this.catNameAr,
      this.catImage,
      this.catCreateTime,
      this.cartId,
      this.cartUserId,
      this.cartItemId,
      this.cartCount,
      this.itemPriceDiscountWithCount,
      this.cartPrice,
      this.isCart});

  CartModel.fromJson(Map<String, dynamic> json) {
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
    itemPriceDiscount = calculateDiscount(itemPrice!, itemDiscount);
    itemCreateTime = json['item_create_time'];
    catId = json['cat_id'];
    catName = json['cat_name'];
    catNameAr = json['cat_name_ar'];
    catImage = json['cat_image'];
    catCreateTime = json['cat_create_time'];
    cartId = json['cart_id'];
    cartUserId = json['cart_user_id'];
    cartItemId = json['cart_item_id'];
    cartCount = json['cart_count'];
    cartPrice = json['cart_price'];
    isCart = json['isCart'];
    itemPriceDiscountWithCount = itemPriceDiscount;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
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
  //   data['cat_id'] = this.catId;
  //   data['cat_name'] = this.catName;
  //   data['cat_name_ar'] = this.catNameAr;
  //   data['cat_image'] = this.catImage;
  //   data['cat_create_time'] = this.catCreateTime;
  //   data['cart_id'] = this.cartId;
  //   data['cart_user_id'] = this.cartUserId;
  //   data['cart_item_id'] = this.cartItemId;
  //   data['cart_count'] = this.cartCount;
  //   data['cart'] = this.cart;
  //   return data;
  // }

  double calculateDiscount(String price1, discount) {
    double price = double.parse(price1);
    return price - (price * int.parse(discount) / 100);
  }
}
