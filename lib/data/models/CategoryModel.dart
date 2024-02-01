class CategoryModel {
  String? catId;
  String? catName;
  String? catNameAr;
  String? catImage;
  String? catCreateTime;

  CategoryModel(
      {this.catId,
      this.catName,
      this.catNameAr,
      this.catImage,
      this.catCreateTime});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    catId = json['cat_id'];
    catName = json['cat_name'];
    catNameAr = json['cat_name_ar'];
    catImage = json['cat_image'];
    catCreateTime = json['cat_create_time'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['cat_id'] = this.catId;
  //   data['cat_name'] = this.catName;
  //   data['cat_name_ar'] = this.catNameAr;
  //   data['cat_image'] = this.catImage;
  //   data['cat_create_time'] = this.catCreateTime;
  //   return data;
  // }
}
