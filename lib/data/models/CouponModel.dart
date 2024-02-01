class CouponModel {
  String? couponId;
  String? couponName;
  String? couponCount;
  String? couponDicount;
  String? couponExpired;

  CouponModel(
      {this.couponId,
      this.couponName,
      this.couponCount,
      this.couponDicount,
      this.couponExpired});

  CouponModel.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id'];
    couponName = json['coupon_name'];
    couponCount = json['coupon_count'];
    couponDicount = json['coupon_dicount'];
    couponExpired = json['coupon_expired'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['coupon_id'] = this.couponId;
  //   data['coupon_name'] = this.couponName;
  //   data['coupon_count'] = this.couponCount;
  //   data['coupon_dicount'] = this.couponDicount;
  //   data['coupon_expired'] = this.couponExpired;
  //   return data;
  // }
}
