class AddressModel {
  String? addressId;
  String? addressUserId;
  String? addressCity;
  String? addressStrees;
  String? addressLat;
  String? addressLng;

  AddressModel({
    this.addressId,
    this.addressUserId,
    this.addressCity,
    this.addressStrees,
    this.addressLat,
    this.addressLng,
  });

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressUserId = json['address_user_id'];
    addressCity = json['address_city'];
    addressStrees = json['address_strees'];
    addressLat = json['address_lat'];
    addressLng = json['address_lng'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['address_id'] = this.addressId;
  //   data['address_user_id'] = this.addressUserId;
  //   data['address_city'] = this.addressCity;
  //   data['address_strees'] = this.addressStrees;
  //   data['address_lat'] = this.addressLat;
  //   data['address_lng'] = this.addressLng;
  //   return data;
  // }
}
