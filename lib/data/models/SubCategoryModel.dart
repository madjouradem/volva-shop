class SubCategoryModel {
  String? subcatId;
  String? subcatCatId;
  String? subcatName;
  String? subcatNameAr;
  String? subcatImage;
  String? subcatCreateTime;

  SubCategoryModel(
      {this.subcatId,
      this.subcatCatId,
      this.subcatName,
      this.subcatNameAr,
      this.subcatImage,
      this.subcatCreateTime});

  SubCategoryModel.fromJson(Map<String, dynamic> json) {
    subcatId = json['subcat_id'];
    subcatCatId = json['subcat_cat_id'];
    subcatName = json['subcat_name'];
    subcatNameAr = json['subcat_name_ar'];
    subcatImage = json['subcat_image'];
    subcatCreateTime = json['subcat_create_time'];
  }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['subcat_id'] = this.subcatId;
//     data['subcat_cat_id'] = this.subcatCatId;
//     data['subcat_name'] = this.subcatName;
//     data['subcat_name_ar'] = this.subcatNameAr;
//     data['subcat_image'] = this.subcatImage;
//     data['subcat_create_time'] = this.subcatCreateTime;
//     return data;
//   }
}
