class SettingsModel {
  String? settingsId;
  String? settingsCardTitle;
  String? settingsCardBody;
  String? settingsCardImage;
  String? settingsShoppingPrice;

  SettingsModel(
      {this.settingsId,
      this.settingsCardTitle,
      this.settingsCardBody,
      this.settingsCardImage,
      this.settingsShoppingPrice});

  SettingsModel.fromJson(Map<String, dynamic> json) {
    settingsId = json['settings_id'];
    settingsCardTitle = json['settings_card_title'];
    settingsCardBody = json['settings_card_body'];
    settingsCardImage = json['settings_card_image'];
    settingsShoppingPrice = json['settings_shopping_price'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['settings_id'] = this.settingsId;
  //   data['settings_card_title'] = this.settingsCardTitle;
  //   data['settings_card_body'] = this.settingsCardBody;
  //   data['settings_card_image'] = this.settingsCardImage;
  //   data['settings_shopping_price'] = this.settingsShoppingPrice;
  //   return data;
  // }
}
